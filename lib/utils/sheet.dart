import 'package:flutter/material.dart';

class Sheet {
  static open(BuildContext context, Widget sheet) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Theme.of(context).cardColor,
      builder: (context) => sheet,
    );
  }

  static openFrosted(BuildContext context, Widget sheet) {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => sheet,
    );
  }
}
