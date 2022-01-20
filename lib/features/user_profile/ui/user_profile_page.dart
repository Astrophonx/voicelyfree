import 'package:clubroom/components/category_row.dart';
import 'package:clubroom/features/user_profile/components/club_list.dart';
import 'package:clubroom/features/user_profile/components/social_grid.dart';
import 'package:clubroom/features/user_profile/ui/user_content.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:clubroom/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class UserProfilePage extends StatelessWidget {
  final Speaker speaker;
  final bool isMe;

  UserProfilePage(this.speaker, {this.isMe = false});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Scaffold(
      appBar: buildAppBar(theme, context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 16),
            child:
                UserContent(speaker, isTwoLineDescription: false, isMe: isMe),
          ),
          SocialGrid(speaker),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(
                      s.today + ", 8:30 pm",
                      style: theme.textTheme.bodyText2!
                          .copyWith(color: theme.primaryColor),
                    ),
                    trailing: isMe
                        ? MaterialButton(
                            onPressed: () {},
                            child: Text(s.edit),
                            textColor: theme.primaryColor,
                          )
                        : Icon(
                            Icons.notifications,
                            color: theme.disabledColor,
                          ),
                  ),
                  Text(
                    s.discuss_over,
                    style: theme.textTheme.subtitle1,
                  ),
                  SizedBox(height: 8),
                  CategoryRow(s.from_world_warriors),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              s.member_of.toUpperCase(),
              style: theme.textTheme.caption,
            ),
          ),
          SizedBox(height: 16),
          ClubList(),
        ],
      ),
    );
  }

  AppBar buildAppBar(ThemeData theme, BuildContext context) {
    if (isMe) {
      return AppBar(
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, PageRoutes.walletPage),
            icon: Icon(Icons.account_balance_wallet),
            color: theme.disabledColor,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
            color: theme.disabledColor,
          ),
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, PageRoutes.settingsPage),
            icon: Icon(Icons.settings),
            color: theme.disabledColor,
          ),
        ],
      );
    } else {
      return AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: theme.accentColor,
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close),
            color: theme.accentColor,
          ),
        ],
      );
    }
  }
}
