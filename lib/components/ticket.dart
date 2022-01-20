import 'package:clubroom/app_config/app_config.dart';
import 'package:clubroom/assets/assets.dart';
import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  final double price;

  Ticket(this.price);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(Assets.ticket),
          Text(
            "${AppConfig.currency}${price.round()}",
            style: theme.textTheme.caption!.copyWith(color: theme.accentColor),
          ),
        ],
      ),
    );
  }
}
