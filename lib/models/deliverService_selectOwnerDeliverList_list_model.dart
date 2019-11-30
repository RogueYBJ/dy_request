/*
 * Author: Bangjin Yu
 * CreateTime: 2019-11-30 19:53:35.411483
 * Email: 1227169416@qq.com
 * Address: 梦想小镇互联网村
 */
class DeliverServiceSelectOwnerDeliverListListModel {
	final int deliverId; 
	final String deliverNo; 
	final String driverName; 
	final String goodsName; 
	final String goodsType; 
	final String goodsTypeName; 
	final int isWhite; 
	final int loadTime; 
	final int ownerId; 
	final String remark; 
	final String srcAddr; 
	final String srcCityName; 
	final String srcDistrictName; 
	final double srcLatitude; 
	final double srcLongitude; 
	final int status; 
	final String targetAddr; 
	final String targetCityName; 
	final String targetDistrictName; 
	final double transAmount; 
	final int weight; 
	DeliverServiceSelectOwnerDeliverListListModel({this.deliverId = 0,this.deliverNo = '',this.driverName = '',this.goodsName = '',this.goodsType = '',this.goodsTypeName = '',this.isWhite = 0,this.loadTime = 0,this.ownerId = 0,this.remark = '',this.srcAddr = '',this.srcCityName = '',this.srcDistrictName = '',this.srcLatitude = 0.0,this.srcLongitude = 0.0,this.status = 0,this.targetAddr = '',this.targetCityName = '',this.targetDistrictName = '',this.transAmount = 0.0,this.weight = 0,});
	factory DeliverServiceSelectOwnerDeliverListListModel.fromMap(Map data) {
		return DeliverServiceSelectOwnerDeliverListListModel(deliverId:data['deliverId'],deliverNo:data['deliverNo'],driverName:data['driverName'],goodsName:data['goodsName'],goodsType:data['goodsType'],goodsTypeName:data['goodsTypeName'],isWhite:data['isWhite'],loadTime:data['loadTime'],ownerId:data['ownerId'],remark:data['remark'],srcAddr:data['srcAddr'],srcCityName:data['srcCityName'],srcDistrictName:data['srcDistrictName'],srcLatitude:data['srcLatitude'],srcLongitude:data['srcLongitude'],status:data['status'],targetAddr:data['targetAddr'],targetCityName:data['targetCityName'],targetDistrictName:data['targetDistrictName'],transAmount:data['transAmount'],weight:data['weight'],);
	}

}