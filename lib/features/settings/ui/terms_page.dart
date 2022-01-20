import 'package:clubroom/components/constants.dart';
import 'package:clubroom/components/light_dark_text.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context)!.settings.arguments as String;
    var theme = Theme.of(context);
    var s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toUpperCase()),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        physics: BouncingScrollPhysics(),
        children: [
          Text(
            kLoremText1,
            style: theme.textTheme.caption!.copyWith(height: 1.7),
          ),
          SizedBox(height: 20),
          Text(
            kLoremText2,
            style: theme.textTheme.caption!.copyWith(height: 1.7),
          ),
          SizedBox(height: 20),
          Text(
            kLoremText3,
            style: theme.textTheme.caption!.copyWith(height: 1.7),
          ),
          if (title != s.tnc) SizedBox(height: 20),
          if (title != s.tnc)
            LightDarkText(
              title == s.privacy_policy ? s.terms_of_use : (s.heading + " 1"),
              kLoremText2,
            ),
          if (title != s.tnc) SizedBox(height: 20),
          if (title != s.tnc)
            LightDarkText(
              title == s.privacy_policy ? s.privacy_policy : s.heading + " 2",
              kLoremText3,
            ),
          SizedBox(height: 20),
          if (title != s.privacy_policy)
            LightDarkText(s.heading + " 3", kLoremText1),
        ],
      ),
    );
  }
}
