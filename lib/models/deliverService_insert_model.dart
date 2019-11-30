/*
 * Author: Bangjin Yu
 * CreateTime: 2019-11-30 18:50:41.183572
 * Email: 1227169416@qq.com
 * Address: 梦想小镇互联网村
 */

class DeliverServiceInsertModel {
  final String contactPerson; //收货联系人
  final String mobile; //收货联系人手机号
  final String remark; //备注
  final String srcAddr; //发货地址
  final String targetAddr; //收货地址
  final String srcLongitude; //发货经度
  final String srcLatitude; //发货纬度
  final String targetLatitude; //收货经度
  final String targetLongitude; //收货纬度
  final String targetProvinceName; //收货省
  final String srcProvinceName; //发货省
  final String srcDistrictName; //发货区
  final String targetDistrictName; //收货区
  final String targetCityName; //收货市
  final String srcCityName; //发货市
  final int weight; //货物重量
  final String goodsType; //货物类型
  final int loadTime; //装货时间
  final String transAmount; //运费
  DeliverServiceInsertModel({
    this.contactPerson = '',
    this.mobile = '',
    this.remark = '',
    this.srcAddr = '',
    this.targetAddr = '',
    this.srcLongitude = '',
    this.srcLatitude = '',
    this.targetLatitude = '',
    this.targetLongitude = '',
    this.targetProvinceName = '',
    this.srcProvinceName = '',
    this.srcDistrictName = '',
    this.targetDistrictName = '',
    this.targetCityName = '',
    this.srcCityName = '',
    this.weight = 0,
    this.goodsType = '',
    this.loadTime = 0,
    this.transAmount = '',
  });
  factory DeliverServiceInsertModel.fromMap(Map data) {
    return DeliverServiceInsertModel(
      contactPerson: data['contactPerson'],
      mobile: data['mobile'],
      remark: data['remark'],
      srcAddr: data['srcAddr'],
      targetAddr: data['targetAddr'],
      srcLongitude: data['srcLongitude'],
      srcLatitude: data['srcLatitude'],
      targetLatitude: data['targetLatitude'],
      targetLongitude: data['targetLongitude'],
      targetProvinceName: data['targetProvinceName'],
      srcProvinceName: data['srcProvinceName'],
      srcDistrictName: data['srcDistrictName'],
      targetDistrictName: data['targetDistrictName'],
      targetCityName: data['targetCityName'],
      srcCityName: data['srcCityName'],
      weight: data['weight'],
      goodsType: data['goodsType'],
      loadTime: data['loadTime'],
      transAmount: data['transAmount'],
    );
  }

  Map toMap() {
    return {
      'contactPerson': contactPerson,
      'mobile': mobile,
      'remark': remark,
      'srcAddr': srcAddr,
      'targetAddr': targetAddr,
      'srcLongitude': srcLongitude,
      'srcLatitude': srcLatitude,
      'srcLongitude': srcLongitude,
      'targetLatitude': targetLatitude,
      'targetLongitude': targetLongitude,
      'targetProvinceName': targetProvinceName,
      'srcProvinceName': srcProvinceName,
      'srcDistrictName': srcDistrictName,
      'targetDistrictName': targetDistrictName,
      'targetCityName': targetCityName,
      'srcCityName': srcCityName,
      'weight': weight,
      'goodsType': goodsType,
      'loadTime': loadTime,
      'transAmount': transAmount,
    };
  }
}
