import 'package:clubroom/app_config/app_config.dart';
import 'package:clubroom/components/constants.dart';
import 'package:clubroom/components/frosted_container.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/components/category_row.dart';

class ClubRoomRulesSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return FrostedContainer(
      padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 6,
                width: 60,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            SizedBox(height: 16),
            CategoryRow(s.app_ui_design),
            SizedBox(height: 8),
            Text(
              AppConfig.appName + " " + s.rules,
              style: theme.textTheme.subtitle1,
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  TitleWithDesc(title: s.rule_one, description: kLoremText1),
                  TitleWithDesc(title: s.rule_two, description: kLoremText2),
                  TitleWithDesc(title: s.rule_three, description: kLoremText3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleWithDesc extends StatelessWidget {
  final String title;
  final String description;

  TitleWithDesc({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(height: 12),
        Text(
          description,
          style: Theme.of(context).textTheme.caption!.copyWith(height: 1.7),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
