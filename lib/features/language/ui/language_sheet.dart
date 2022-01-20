import 'package:clubroom/app_config/app_config.dart';
import 'package:clubroom/features/language/logic/language_cubit.dart';
import 'package:clubroom/generated/l10n.dart';
import 'package:clubroom/logic/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageSheet extends StatefulWidget {
  @override
  _LanguageSheetState createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  late LanguageCubit _languageCubit;

  @override
  void initState() {
    super.initState();
    _languageCubit = context.read<LanguageCubit>()..getCurrentLanguage();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              S.of(context).app_language,
              textAlign: TextAlign.center,
              style: theme.textTheme.headline6,
            ),
          ),
          Expanded(
            child: BlocBuilder<LanguageCubit, Locale>(
              builder: (context, currentLocale) {
                language = AppConfig.languagesSupported[selectedLangCode];
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: AppConfig.languagesSupported.length,
                  itemBuilder: (context, index) {
                    var langCode =
                        AppConfig.languagesSupported.keys.elementAt(index);
                    return RadioListTile(
                      title: Text(AppConfig.languagesSupported[langCode]!),
                      value: langCode,
                      groupValue: selectedLangCode,
                      onChanged: (langCode) async {
                        setState(() {
                          selectedLangCode = langCode as String;
                        });
                      },
                      activeColor: theme.primaryColor,
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        foregroundColor: theme.accentColor,
        child: Icon(Icons.check),
        onPressed: () async {
          await _languageCubit.setCurrentLanguage(selectedLangCode!);
          Navigator.pop(context);
        },
      ),
    );
  }
}
