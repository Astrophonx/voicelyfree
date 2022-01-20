import 'package:flutter/material.dart';

class Helper {
  static double getContainerHeight(BuildContext context) {
    var mq = MediaQuery.of(context);
    return mq.size.height - AppBar().preferredSize.height - mq.padding.vertical;
  }
}
