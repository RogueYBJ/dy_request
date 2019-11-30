/*
 * @Author Bangjin Yu
 * @Email: 1227169416@qq.com
 * @Address: 梦想小镇互联网村
 * @Date 2019-11-30 15:28:32 Saturday
 */

import 'package:dy_request/overlay/dio_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum DioStatus {
  normal,
  successful,
  prompt,
  error,
}

class DioShow {
  ///计数引用
  static int _count = 0;

  static String _msg;

  static DioStatus _dioStatus;

  static void show(String msg, {DioStatus dioStatus = DioStatus.normal}) {
    _count += 1;
    _msg = msg;
    _dioStatus = dioStatus;
    DioOverlay.addOverlayEntry(_loadingView());
  }

  static void dismiss() {
    _count -= 1;
    if (_count <= 0) {
      DioOverlay.clean();
    }
  }

  ///提示语
  static void prompt(String msg, {int seconds = 2000}) {
    show(msg, dioStatus: DioStatus.prompt);
    new Future.delayed(Duration(milliseconds: seconds), () => dismiss());
  }

  ///成功
  static void successful(String msg) {
    show(msg, dioStatus: DioStatus.successful);
    new Future.delayed(const Duration(milliseconds: 2000), () => dismiss());
  }

  ///失败
  static void error(String msg) {
    show(msg, dioStatus: DioStatus.error);
    new Future.delayed(const Duration(milliseconds: 2000), () => dismiss());
  }

  static Widget _loadingView() {
    return new Scaffold(
      backgroundColor: Color(0x40000000),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(20),
                color: Color(0xFFFFFFFF),
                child: new Center(
                  child: new Text(_msg),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
