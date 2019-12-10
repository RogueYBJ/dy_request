/*
 * Author: Bangjin Yu
 * CreateTime: 2019-12-10 21:54:09.991521
 * Email: 1227169416@qq.com
 * Address: 梦想小镇互联网村
 */
class DeliverServiceInsertModel {
	final String contactPerson; 
	final String mobile; 
	final String remark; 
	final String srcAddr; 
	final String targetAddr; 
	final String srcLongitude; 
	final String srcLatitude; 
	final String targetLatitude; 
	final String targetLongitude; 
	final String targetProvinceName; 
	final String srcProvinceName; 
	final String srcDistrictName; 
	final String targetDistrictName; 
	final String targetCityName; 
	final String srcCityName; 
	final int weight; 
	final String goodsType; 
	final int loadTime; 
	final String transAmount; 
	DeliverServiceInsertModel({this.contactPerson = '',this.mobile = '',this.remark = '',this.srcAddr = '',this.targetAddr = '',this.srcLongitude = '',this.srcLatitude = '',this.targetLatitude = '',this.targetLongitude = '',this.targetProvinceName = '',this.srcProvinceName = '',this.srcDistrictName = '',this.targetDistrictName = '',this.targetCityName = '',this.srcCityName = '',this.weight = 0,this.goodsType = '',this.loadTime = 0,this.transAmount = '',});
	factory DeliverServiceInsertModel.fromMap(Map data) {
		return DeliverServiceInsertModel(contactPerson:data['contactPerson'],mobile:data['mobile'],remark:data['remark'],srcAddr:data['srcAddr'],targetAddr:data['targetAddr'],srcLongitude:data['srcLongitude'],srcLatitude:data['srcLatitude'],targetLatitude:data['targetLatitude'],targetLongitude:data['targetLongitude'],targetProvinceName:data['targetProvinceName'],srcProvinceName:data['srcProvinceName'],srcDistrictName:data['srcDistrictName'],targetDistrictName:data['targetDistrictName'],targetCityName:data['targetCityName'],srcCityName:data['srcCityName'],weight:data['weight'],goodsType:data['goodsType'],loadTime:data['loadTime'],transAmount:data['transAmount'],);
	}
	Map toMap(){
		return {'contactPerson':contactPerson,'mobile':mobile,'remark':remark,'srcAddr':srcAddr,'targetAddr':targetAddr,'srcLongitude':srcLongitude,'srcLatitude':srcLatitude,'targetLatitude':targetLatitude,'targetLongitude':targetLongitude,'targetProvinceName':targetProvinceName,'srcProvinceName':srcProvinceName,'srcDistrictName':srcDistrictName,'targetDistrictName':targetDistrictName,'targetCityName':targetCityName,'srcCityName':srcCityName,'weight':weight,'goodsType':goodsType,'loadTime':loadTime,'transAmount':transAmount,};
	}

}