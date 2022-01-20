import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  final VoidCallback? onMorePressed;
  final bool isMoreContainerOpened;

  MoreButton(this.onMorePressed, this.isMoreContainerOpened);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onMorePressed,
      icon: Icon(isMoreContainerOpened ? Icons.close : Icons.more_horiz),
      color: Theme.of(context).accentColor,
    );
  }
}
