import 'package:clubroom/app_config/app_config.dart';
import 'package:clubroom/assets/assets.dart';
import 'package:clubroom/components/custom_button.dart';
import 'package:clubroom/features/wallet/ui/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.wallet.toUpperCase()),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.available_amount_in_wallet,
                        style: theme.textTheme.caption,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${AppConfig.currency} 58.00",
                        style: theme.textTheme.headline5,
                      )
                    ],
                  ),
                  Image.asset(
                    Assets.wallet,
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                ],
              ),
              SizedBox(height: 48),
              TransactionList(),
            ],
          ),
          PositionedDirectional(
            top: 124,
            end: 20,
            child: CustomButton(text: s.add_money),
          ),
        ],
      ),
    );
  }
}
