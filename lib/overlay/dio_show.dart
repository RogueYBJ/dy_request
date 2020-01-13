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

  static String successfulImg = '';
  static String promptImg = '';
  static String errorImg = '';

  ///计数引用
  static int _count = 0;

  static String _msg;

  static DioStatus _dioStatus;

  static void show(
    String msg, {
    DioStatus dioStatus = DioStatus.normal,
    bool isShow = true,
  }) {
    if (isShow) {
      _count += 1;
      _msg = msg;
      _dioStatus = dioStatus;
      DioOverlay.addOverlayEntry(_loadingView());
    }
  }

  static void dismiss() {
    _count -= 1;
    if (_count <= 0) {
      DioOverlay?.clean();
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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10)),
                child: new Column(
                  children: <Widget>[
                    _getCenterStatus(_dioStatus),
                    new Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: new Text(_msg),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  ///加载状态
  static Widget _getCenterStatus(DioStatus status) {
    Widget view = new CircularProgressIndicator(
      strokeWidth: 1,
    ); //new CupertinoActivityIndicator(radius: ScreenUtil.instance.setWidth(40),);
    switch (status) {
      case DioStatus.successful:
        view = new Container(
          width: 50,
          height: 50,
          child: successfulImg==''? null : Image.asset(
            successfulImg,
            frameBuilder: (_, w, i, b) {
              return i == null ? Icon(Icons.error) : w;
            },
          ),
        );
        break;
      case DioStatus.prompt:
        view = new Container(
          width: 50,
          height: 50,
          child: promptImg==''? null : Image.asset(
            promptImg,
            frameBuilder: (_, w, i, b) {
              return i == null ? Icon(Icons.error) : w;
            },
          ),
        );
        break;
      case DioStatus.error:
        view = new Container(
          width: 50,
          height: 50,
          child: errorImg==''? null :  Image.asset(
            errorImg,
            frameBuilder: (_, w, i, b) {
              return i == null ? Icon(Icons.error) : w;
            },
          ),
        );
        break;
      default:
    }
    return view;
  }
}
