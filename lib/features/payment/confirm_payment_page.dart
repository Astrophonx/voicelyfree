import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:clubroom/app_config/app_config.dart';
import 'package:clubroom/assets/assets.dart';
import 'package:clubroom/components/category_row.dart';
import 'package:clubroom/components/custom_button.dart';
import 'package:clubroom/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class ConfirmPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var room = ModalRoute.of(context)!.settings.arguments as Room;
    var s = S.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.payment.toUpperCase()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Spacer(),
          buildColumn(
            theme,
            s.amount_available,
            t2: "${AppConfig.currency}58.00",
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          Spacer(flex: 2),
          Expanded(
              flex: 5,
              child: Image.asset(Assets.wallet, scale: 2.8)),
          Spacer(),
          Text(s.confirm_ticket_purchase, style: theme.textTheme.subtitle1),
          Spacer(flex: 2),
          FadedSlideAnimation(
            child: Container(
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "room.title",
                    style: theme.textTheme.subtitle1,
                  ),
                  SizedBox(height: 4),
                  CategoryRow("room.category"),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildColumn(theme, s.date, t2: "24 June, 2020"),
                      buildColumn(theme, s.time, t2: "06:00 pm"),
                      buildColumn(theme, s.remind_me,
                          icon: Icons.notifications_active),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildColumn(
                        theme,
                        s.total_amount_to_pay,
                        t2: "${AppConfig.currency}9.00",
                      ),
                      CustomButton(
                        text: s.pay_via_wallet,
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, PageRoutes.paymentDonePage),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            beginOffset: Offset(0.0, 0.2),
            endOffset: Offset.zero,
          ),
        ],
      ),
    );
  }

  Column buildColumn(
    ThemeData theme,
    String t1, {
    String? t2,
    IconData? icon,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(t1, style: theme.textTheme.caption),
        SizedBox(height: 4),
        if (t2 != null) Text(t2, style: theme.textTheme.subtitle1),
        if (icon != null)
          Transform.rotate(
            angle: -pi / 8,
            child: Icon(
              icon,
              color: theme.primaryColor,
            ),
          ),
      ],
    );
  }
}
