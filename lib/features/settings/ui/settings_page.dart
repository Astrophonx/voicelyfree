import 'package:clubroom/app_config/app_config.dart';
import 'package:clubroom/app_config/app_theme.dart';
import 'package:clubroom/features/language/ui/language_sheet.dart';
import 'package:clubroom/logic/theme_cubit.dart';
import 'package:clubroom/logic/variables.dart';
import 'package:clubroom/routes/routes.dart';
import 'package:clubroom/utils/sheet.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool pauseNotifications = false;
  late bool isDark;
  late ThemeCubit _themeCubit;

  @override
  void initState() {
    super.initState();
    _themeCubit = BlocProvider.of<ThemeCubit>(context)..getCurrentTheme();
  }

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    var padding = EdgeInsets.symmetric(horizontal: 30);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.settings),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          SwitchListTile(
            contentPadding: padding,
            value: pauseNotifications,
            onChanged: (value) {
              setState(() {
                pauseNotifications = value;
              });
            },
            title: Text(s.pause_notif),
            inactiveThumbColor: theme.disabledColor,
            inactiveTrackColor: theme.dividerColor.withOpacity(0.5),
          ),
          BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, currentTheme) {
              isDark = currentTheme == AppTheme.darkTheme;
              return SwitchListTile(
                contentPadding: padding,
                value: isDark,
                onChanged: (bool value) async {
                  String theme = value ? "dark" : "light";
                  await _themeCubit.setCurrentTheme(theme);
                },
                title: Text(s.dark_mode),
                inactiveThumbColor: theme.disabledColor,
                inactiveTrackColor: theme.dividerColor.withOpacity(0.5),
              );
            },
          ),
          ListTile(
            contentPadding: padding,
            title: Text(S.of(context).app_language),
            trailing: Text(language!, style: theme.textTheme.caption),
            onTap: () => Sheet.open(context, LanguageSheet()),
          ),
          Divider(thickness: 0.2),
          ListTile(
            contentPadding: padding,
            title: Text(s.interests),
            onTap: () {},
          ),
          Divider(thickness: 0.2),
          ListTile(
            contentPadding: padding,
            title: Text(s.faqs),
            onTap: () => Navigator.pushNamed(context, PageRoutes.faqsPage),
          ),
          ListTile(
            contentPadding: padding,
            title: Text(s.tnc),
            onTap: () => Navigator.pushNamed(context, PageRoutes.termsPage,
                arguments: s.tnc),
          ),
          ListTile(
            contentPadding: padding,
            title: Text(s.community_guidelines),
            onTap: () => Navigator.pushNamed(context, PageRoutes.termsPage,
                arguments: s.community_guidelines),
          ),
          ListTile(
            contentPadding: padding,
            title: Text(s.privacy_policy),
            onTap: () => Navigator.pushNamed(context, PageRoutes.termsPage,
                arguments: s.privacy_policy),
          ),
          Divider(thickness: 0.2),
          ListTile(
            contentPadding: padding,
            title: Text(
              s.logout,
              style: theme.textTheme.subtitle1!
                  .copyWith(color: theme.primaryColor),
            ),
            onTap: () => Phoenix.rebirth(context),
          ),
          Divider(thickness: 0.2),
          Padding(
            padding: padding.copyWith(top: 20),
            child: Text(
              s.version + " " + AppConfig.appVersion,
              style: theme.textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
