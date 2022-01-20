import 'package:flutter/material.dart';

class LightDarkText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final bool isTwoLine;

  LightDarkText(this.firstText, this.secondText, {this.isTwoLine = true});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: theme.textTheme.headline6!.copyWith(fontSize: 16, height: 2),
          ),
          TextSpan(text: isTwoLine ? "\n" : " "),
          TextSpan(
            text: secondText,
            style: theme.textTheme.caption!.copyWith(height: 1.7),
          ),
        ],
      ),
    );
  }
}
