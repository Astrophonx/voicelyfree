import 'package:clubroom/app_config/app_config.dart';
import 'package:clubroom/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class PriceSection extends StatefulWidget {
  @override
  _PriceSectionState createState() => _PriceSectionState();
}

class _PriceSectionState extends State<PriceSection>
    with SingleTickerProviderStateMixin {
  bool paidEvent = true;

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      children: [
        SwitchListTile(
          value: paidEvent,
          onChanged: (value) {
            setState(() {
              paidEvent = value;
            });
          },
          title: Text(s.paid_event),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          vsync: this,
          child: paidEvent
              ? CustomTextField(
                  prefixIcon: Icon(
                    Icons.account_balance_wallet,
                    color: Theme.of(context).disabledColor,
                    size: 20,
                  ),
                  hint: s.enter_ticket_amount +
                      " (${s.inText} ${AppConfig.currency})",
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}
