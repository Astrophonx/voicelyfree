import 'package:clubroom/assets/assets.dart';
import 'package:clubroom/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class PaymentDonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.successful.toUpperCase()),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(flex: 4),
            Image.asset(Assets.done, scale: 2.8),
            Spacer(),
            Text(
              s.your_ticket_purchased_confirmed,
              style: theme.textTheme.subtitle1,
            ),
            SizedBox(height: 16),
            Text(s.join_clubroom, style: theme.textTheme.caption),
            Spacer(flex: 4),
            CustomButton(
              text: s.home,
              onPressed: () => Navigator.pop(context),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
