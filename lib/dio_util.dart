/*
 * @Author Bangjin Yu
 * @Email: 1227169416@qq.com
 * @Address: 梦想小镇互联网村
 * @Date 2019-11-12 15:35:59 Tuesday
 */

import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:dy_request/overlay/dio_show.dart';
import 'package:flutter/cupertino.dart';

import 'log_util.dart';

class DioUtil<T> {
  static BuildContext mianStateContext;

//  final String httpURL = 'http://122.112.142.159/api'; //线上数据库

  static String httpURL = 'http://192.168.0.104:8080/'; //测试数据库

  static String version = '1.0.0'; //测试数据库

  /// 实例类
  static DioUtil _instance;

  /// 登录后的token
  static String token = '';

  /// model文件路径
  static String filePath = '';

  /// 保存网络状态ConnectivityResult result
  static ConnectivityResult result;

  /// 请求完成的方法
  static void Function(ResponseData) responseAction;

  Dio _dio;

  int _connectTimeout = 7000;

  int _receiveTimeout = 7000;

  static RequestData _requestData;

  DioUtil();

  factory DioUtil.instance() {
    ///请将当前项目路径/Users/ironman/Documents/flutter/package/更改为你自己电脑的项目路径 ps:注意models/后面加/
    // FileUtil.filePath =
    //     r"/Users/ironman/Documents/flutter/package/dy_request/lib/models/";
    // if (filePath.length>0) {
    //   FileUtil.filePath = filePath;
    // }
    if (_instance == null) {
      print('instance');
      _instance = new DioUtil().._init();
    }
    return _instance;
  }

  void _init() {
    if (_dio == null) {
      print('_init');
      _dio = Dio();
      _dio.options = BaseOptions(
        headers: {
          'device': Platform.isIOS ? 'iOS' : 'Android',
          'version': version,
        },
        baseUrl: httpURL,
        method: "post",
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        contentType: 'application/x-www-form-urlencoded',
      );
    }
  }

  Dio dio() {
    return _dio;
  }

  Future<ResponseData<T>> post(
    String url,
    dynamic data, {
    Map<String, dynamic> headerMap,
    bool isShow = false,
    String msg = '加载中...',
    bool isModel = false,
  }) async {
    /// 检查网络
    if (result == null || result == ConnectivityResult.none) {
      if (result == null) {
        DioShow.prompt('请监听网络住状态');
      } else {
        DioShow.prompt('请检查网络');
      }
      return null;
    }

    DioShow.show('加载中...', isShow: isShow);
    Map<String, dynamic> headersMap = {'atk': token};
    if (headerMap != null) {
      headersMap.addAll(headerMap);
    }

    _requestData = RequestData.fromMap(
        {'url': url, 'body': data, 'options': Options(headers: headersMap)});

    Response<dynamic> response;
    try {
      response = await _dio
          .post(
        _requestData.url,
        data: _requestData.body,
        options: _requestData.options,
      )
          .catchError((onError) {
        LogUtil().out(onError);
        DioShow.dismiss();
        return null;
      });
    } catch (e) {
      LogUtil().out(e);
      DioShow.dismiss();
      return null;
    }
    DioShow.dismiss();

    if ((response?.statusCode ?? 101) == 200) {
      ResponseData responseData = ResponseData.fromMap(response?.data ?? {});
      LogUtil().out(responseData?.data ?? '没有数据');
      if ((responseData?.code ?? 101) != 0) {
        DioShow.prompt(responseData?.msg ?? '出错');
      }
      if (responseAction != null) {
        responseAction(responseData);
      }
      return responseData;
    } else {
      DioShow.error('网络错误');
      return null;
    }
  }

  // Future<dynamic> post(String s, dynamic data,
  //     {bool isShow = false,
  //     String msg = '加载中...',
  //     bool isModel = false}) async {
  //   /// 检查网络
  //   if (result == null || result == ConnectivityResult.none) {
  //     if (result == null) {
  //       DioShow.prompt('请监听网络住状态');
  //     } else {
  //       DioShow.prompt('请检查网络');
  //     }
  //     return null;
  //   }

  //   DioShow.show('加载中...', isShow: isShow);

  //   try {
  //     _setRequestData(s, data);
  //   } catch (e) {
  //     clearAssets();
  //     DioShow.dismiss();
  //     if (mianStateContext != null) {
  //       new MainNotification(mainState: MainState.login)
  //           .dispatch(mianStateContext);
  //     } else {
  //       LogUtil().out('请设置mianStateContext');
  //     }
  //     LogUtil().out(e);
  //     return null;
  //   }

  //   Response<dynamic> response;
  //   try {
  //     response = await _dio
  //         .post(
  //       _requestData.url,
  //       data: _requestData.body,
  //       options: _requestData.options,
  //     )
  //         .catchError((onError) {
  //       LogUtil().out(onError);
  //       DioShow.dismiss();
  //       return null;
  //     });
  //   } catch (e) {
  //     LogUtil().out(e);
  //     DioShow.dismiss();
  //     return null;
  //   }
  //   DioShow.dismiss();
  //   if (response?.statusCode == 200) {
  //     Map data = response.data;
  //     LogUtil().out(data);
  //     if (data['code'] == 0) {
  //       if (data['data'] != null) {
  //         if (data['data'] is Map) {
  //           if (isModel) {
  //             FileUtil.fromFileName(s).writeAsMap(data['data']);
  //           }
  //         }
  //         return data['data'];
  //       } else {
  //         return true;
  //       }
  //     } else {
  //       DioShow.prompt(data['msg']);
  //       if (data['msg'] == '登录过期！') {
  //         token = '';
  //         clearAssets();
  //         if (mianStateContext != null) {
  //           new MainNotification(mainState: MainState.login)
  //               .dispatch(mianStateContext);
  //         } else {
  //           DioShow.prompt('请设置mianStateContext');
  //         }
  //       }
  //       return null;
  //     }
  //   } else {
  //     DioShow.error('网络错误');
  //     return null;
  //   }
  // }

  // void _setRequestData(String s, dynamic data) {
  //   if (data is Map && data.length > 5) {
  //     FileUtil.fromFileName('deliverService.insert').writeAsMap(data);
  //   }
  //   if (token == '' &&
  //       !(s == 'accountService.login' ||
  //           s == 'accountService.sendVevifyCode')) {
  //     throw ('token不能为空');
  //   } else {
  //     Map requestData;
  //     if (data is Map<String, File>) {
  //       FormData formData = new FormData();
  //       data.forEach((key, file) {
  //         formData.add(key, new UploadFileInfo(file, "$key.png"));
  //       });
  //       formData.add('s', s);
  //       requestData = {'url': httpURL, 'body': formData};
  //     } else {
  //       var json = data is Map ? jsonEncode(data) : data;
  //       Map<String, dynamic> body = (data == null
  //           ? {'s': s, 'k': token}
  //           : {'s': s, 'p': '$json', 'k': token});
  //       requestData = {'url': httpURL, 'body': body};
  //     }
  //     _requestData = RequestData.fromMap(requestData);
  //     LogUtil().out(_requestData.body);
  //   }
  // }
}

class RequestData {
  final String url;
  final Map body;
  final Options options;

  RequestData({this.url, this.body, this.options});
  factory RequestData.fromMap(Map data) {
    return RequestData(
      url: data['url'],
      body: data['body'],
      options: data['options'],
    );
  }
}

class ResponseData<T> {
  final String msg;
  final int code;
  final T data;

  ResponseData({this.msg, this.code, this.data});

  factory ResponseData.fromMap(Map data) {
    return ResponseData(
      msg: data['msg'] ?? '',
      code: data['code'] ?? 101,
      data: data['data'] ?? {},
    );
  }
}
