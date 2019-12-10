/*
 * @Author Bangjin Yu
 * @Email: '1'227'1'694'1'6@qq.com
 * @Address: 梦想小镇互联网村
 * @Date 20'1'9-'1''1'-30 '1'7:4'1':04 Saturday
 */

library dy_request;

import 'package:dy_request/dio_assets.dart';
import 'package:dy_request/dio_util.dart';
import 'models/model_header.dart';

export 'overlay/overlay_create.dart';
export 'package:connectivity/connectivity.dart';

export 'notification.dart';
export 'log_util.dart';
export 'dio_dialog.dart';
export 'dio_assets.dart';
export 'dio_util.dart';
export 'overlay/dio_show.dart';
export 'models/model_header.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus '1'.
  int addOne(int value) => value + 1;
}

class DYRequest {}

/// 登录接口 accountService.login
/// mobile:手机号 userType:用户类型('1'-货主 2-司机) verifyCode:验证码 deviceToken:设备id deviceType:设备 '1':iOS  2:Android

Future<String> apiASLogin(Map data) {
  if (DioUtil.token != '') return null;
  return DioUtil.instance().post('accountService.login', data).then((token) {
    if (token != null) {
      DioUtil.token = token;
      setAssetsToken(token);
    }
    return null;
  });
}

/// 发送验证码 accountService.sendVevifyCode mobile:手机号 userType:用户类型('1'-货主 2-司机)
Future<bool> apiASSendVevifyCode(Map data) {
  return DioUtil.instance().post('accountService.sendVevifyCode', data);
}

/// 货主根据条件查看订单 deliverService.selectOwnerDeliverList
/// current:当前页 size:页显示数量 cond:查询条件 map {"status":'1'}'1':待接单 2:已接单 3:装货中 4:运输中 5:已到达 6:已完成 7:已取消 8:已指派 9:已支付
/// {int current = '1', int size = '1'0}   ////当前页,页显示数量
Future<List<DeliverServiceSelectOwnerDeliverListListModel>>
    apiDSSelectOwnerDeliverList(
        {int status = -1, int current = 1, int size = 10}) {
  Map cond = {"status": '1,8'};
  switch (status) {
    case 0:
      cond = {"status": '1,8'};
      break;
    case 1:
      cond = {"status": '2'};
      break;
    case 2:
      cond = {"status": '9'};
      break;
    case 3:
      cond = {"status": '3'};
      break;
    case 4:
      cond = {"status": '4'};
      break;
    case 5:
      cond = {"status": '5'};
      break;
    case 6:
      cond = {"status": '6,7'};
      break;
    case -1:
      cond = {"status": '1,2,3,4,5,6,7,8,9'};
      break;
    default:
  }
  Map data = {"current": current, "size": size, "cond": cond};
  return DioUtil.instance()
      .post('deliverService.selectOwnerDeliverList', data)
      .then((value) {
    if (value != null) {
      List list = value['list'];
      if (list.length > 0) {
        return DeliverServiceSelectOwnerDeliverListModel.fromMap({'list': list})
            .getDeliverServiceSelectOwnerDeliverListListModel();
      }
    }
    return null;
  });
}

/// 获取常用发货位置 ownerAddrService.selectList current:当前页 size:'1'0
Future<dynamic> apiOASSelectList() {
  return DioUtil.instance()
      .post('ownerAddrService.selectList', {"current": 1, "size": 10});
}

/// 发货接口 ownerAddrService.selectList current:当前页 size:'1'0
Future<dynamic> apiASInsert() {
  // return requestGET('deliverService.insert',data);
  Map data = {
    'contactPerson': '1',
    'mobile': '1',
    'remark': '1',
    'srcAddr': '1',
    'targetAddr': '1',
    'srcLongitude': '1',
    'srcLatitude': '1',
    'srcLongitude': '1',
    'targetLatitude': '1',
    'targetLongitude': '1',
    'targetProvinceName': '1',
    'srcProvinceName': '1',
    'srcDistrictName': '1',
    'targetDistrictName': '1',
    'targetCityName': '1',
    'srcCityName': '1',
    'weight': 1,
    'goodsType': '1',
    'loadTime': 1231231231231,
    'transAmount': '1',
    // 'contactPerson':'1',
    // 'mobile':'1',
    // 'remark':'1',
  };
  // FileUtil.fromFileName('deliverService.insert').writeAsMap(data);

  return DioUtil.instance().post('deliverService.insert',
      new DeliverServiceInsertModel.fromMap(data).toMap());
}

/// 收货接口 ownerAddrService.selectList deliverId:运输单ID transAmount:支付类型(1:微信 2:支付宝) (Integer)
Future<dynamic> apiDSTakeDelivery({int deliverId = 1, String transAmount = '1'}) {
  return DioUtil.instance().post('deliverService.takeDelivery',
      {"deliverId": deliverId, "payType": 3, "transAmount": transAmount});
}


/// 双乾收货接口 ownerAddrService.selectList deliverId:运输单ID transAmount:支付类型(1:微信 2:支付宝) (Integer)
Future<dynamic> apiDSTakeDelivery2({int deliverId = 1, String transAmount = '1'}) {
  return DioUtil.instance().post('deliverService.takeDelivery2',
      {"deliverId": deliverId, "payType": 3, "transAmount": transAmount});
}
