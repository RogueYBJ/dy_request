

/*
 * @Author Bangjin Yu
 * @Email: 1227169416@qq.com
 * @Address: 梦想小镇互联网村
 * @Date 2019-12-10 21:24:26 Tuesday
 */

import 'package:flutter/material.dart';

///控制main函数的入口
enum MainState {
  ///登录界面
  login,
  ///主页
  tabbar
}

///状态通知
class MainNotification extends Notification {
  MainNotification({Key key,this.mainState});
  MainState mainState;
}