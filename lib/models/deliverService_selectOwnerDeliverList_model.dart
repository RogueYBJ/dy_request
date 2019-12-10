/*
 * Author: Bangjin Yu
 * CreateTime: 2019-12-10 21:06:30.968810
 * Email: 1227169416@qq.com
 * Address: 梦想小镇互联网村
 */
import 'deliverService_selectOwnerDeliverList_list_model.dart';
class DeliverServiceSelectOwnerDeliverListModel {
	final List list; 
	final int totalCount; 
	final int unAuthNum; 
	DeliverServiceSelectOwnerDeliverListModel({this.list,this.totalCount = 0,this.unAuthNum = 0,});
	factory DeliverServiceSelectOwnerDeliverListModel.fromMap(Map data) {
		return DeliverServiceSelectOwnerDeliverListModel(list:data['list'],totalCount:data['totalCount'],unAuthNum:data['unAuthNum'],);
	}
	Map toMap(){
		return {'list':list,'totalCount':totalCount,'unAuthNum':unAuthNum,};
	}
	List<DeliverServiceSelectOwnerDeliverListListModel> getDeliverServiceSelectOwnerDeliverListListModel(){
		List<DeliverServiceSelectOwnerDeliverListListModel> list = [];
		for(Map map in this.list){
			list.add(DeliverServiceSelectOwnerDeliverListListModel.fromMap(map));
		}
		return list;
	}

}