

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressBar {
  OverlayEntry _progressOverlayEntry;

  void show(BuildContext context) {
    _progressOverlayEntry = _createProgressEntry(context);
    Overlay.of(context).insert(_progressOverlayEntry);
  }

  void hide() {
    if (_progressOverlayEntry != null) {
      _progressOverlayEntry.remove();
      _progressOverlayEntry = null;
    }
  }

  OverlayEntry _createProgressEntry(BuildContext context) => OverlayEntry(
      builder: (BuildContext context) => Container(
          color: Color.fromRGBO(255, 255, 255, .5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SpinKitDualRing(
              color: Colors.white,
            ),
          )));

}
