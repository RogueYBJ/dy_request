/*
 * @Author Bangjin Yu
 * @Email: 1227169416@qq.com
 * @Address: 梦想小镇互联网村
 * @Date 2019-11-30 15:34:58 Saturday
 */

import 'package:dy_request/overlay/overlay_create.dart';
import 'package:flutter/material.dart';

import '../log_util.dart';

class DioOverlay {
  static OverlayEntry _overlayEntry;
  static Widget _overlayView;
  static void addOverlayEntry(Widget view) {
    _overlayView = view;
    if (OverlayCreate.context != null) {
      if (_overlayEntry == null) {
        _overlayEntry =
            OverlayEntry(builder: (BuildContext context) => _overlayView);
        print('OverlayView');
        OverlayCreate.createView(_overlayEntry);
      } else {
        if (_overlayEntry != null) {
          _overlayEntry?.markNeedsBuild();
        }
      }
    }else{
      LogUtil().out('context 不可缺少');
    }
  }

  static void clean() {
    if (_overlayEntry != null) {
      print('remove');
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  static void updata(Widget view) {
    _overlayView = view;
    if (_overlayEntry != null) {
      _overlayEntry?.markNeedsBuild();
    }
  }
}
