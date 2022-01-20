import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final String? text;
  final double? width;

  CustomButton({this.onPressed, this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return FadedScaleAnimation(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 48,
          width: width ?? MediaQuery.of(context).size.width / 2.4,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            (text ?? S.of(context).next).toUpperCase(),
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
