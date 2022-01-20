import 'package:clubroom/app_config/app_theme.dart';
import 'package:clubroom/logic/variables.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

class FrostedContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  FrostedContainer({required this.child, this.borderRadius, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeData == AppTheme.lightTheme
          ? Theme.of(context).cardColor.withOpacity(0.2)
          : Theme.of(context).accentColor.withOpacity(0.12),
      padding: padding ?? EdgeInsets.all(20),
      child: child,
    ).frosted(
      borderRadius:
          borderRadius ?? BorderRadius.vertical(top: Radius.circular(24)),
      frostColor: Theme.of(context).cardColor,
      blur: 20,
    );
  }
}
