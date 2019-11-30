/*
 * @Author Bangjin Yu
 * @Email: 1227169416@qq.com
 * @Address: 梦想小镇互联网村
 * @Date 2019-11-30 15:12:20 Saturday
 */

import 'package:flutter/material.dart';

import '../log_util.dart';

class OverlayCreate {

  static BuildContext context;

  static void createView(OverlayEntry overlayEntry) async {
    if (OverlayCreate.context!=null) {
      OverlayState overlayState = Overlay.of(OverlayCreate.context);
      overlayState.insert(overlayEntry);
    }else{
      LogUtil().out('context 不可缺少');
    }
  }
}