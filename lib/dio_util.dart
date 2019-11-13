/*
 * @Author Bangjin Yu
 * @Email: 1227169416@qq.com
 * @Address: 梦想小镇互联网村
 * @Date 2019-11-12 15:35:59 Tuesday
 */

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class DioUtil {
  final String httpURL = 'http://122.112.142.159/api'; //线上数据库

  // final String httpURL2 = 'http://49.235.104.80:8088/api';//测试数据库

  static DioUtil _instance;

  static String token = '';

  Dio _dio;

  int _connectTimeout = 7000;

  int _receiveTimeout = 7000;

  RequestData _requestData;

  DioUtil();

  factory DioUtil.instance() {
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
        method: "post",
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        contentType: ContentType.parse("application/x-www-form-urlencoded"),
      );
    }
  }

  void post(String s, dynamic data, {Function responseData}) async {
    _setRequestData(s, data, errorMSG: (msg) {
      print(msg);
    });
    Response<dynamic> response;
    try {
      response = await _dio.post(
        _requestData.url,
        data: _requestData.body,
        options: _requestData.options,
        
      );
    } catch (e) {
      return;
    }
    if (response?.statusCode == HttpStatus.OK) {
      Map data = response.data;
      if (data['code'] == 0) {
        responseData(data['data']);
      } else {
        error(data);
      }
      return;
    }
  }

  void error(Map data) {
    if (data['code'] >= 600) {
      print(data['msg']);
    } else {
      print(data['code']);
    }
  }

  void _setRequestData(String s, dynamic data, {Function errorMSG}) {
    if (token != '') {
      Map requestData;
      if (data is Map<String,File>) {
        FormData formData = new FormData();
        data.forEach((key,file){
          formData.add(key, new UploadFileInfo(file,"$key.png"));
        });
        formData.add('s', s);
        requestData = {'url': httpURL, 'body': formData};
      }else{
        var json = data is Map ? jsonEncode(data) : data;
        Map<String, dynamic> body = (data == null
            ? {'s': s, 'k': token}
            : {'s': s, 'p': '$json', 'k': token});
        requestData = {'url': httpURL, 'body': body};
      }
      _requestData = RequestData.fromMap(requestData);
    } else {
      errorMSG('token不能为空');
    }
  }
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
