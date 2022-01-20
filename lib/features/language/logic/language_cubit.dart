import 'package:clubroom/app_config/app_config.dart';
import 'package:clubroom/logic/local_data_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(Locale(AppConfig.defaultLanguage));

  void selectLanguage(String langCode) => emit(Locale(langCode));

  void getCurrentLanguage() async {
    String langCode = await LocalDataLayer().getCurrentLanguage();
    selectLanguage(langCode);
  }

  Future<void> setCurrentLanguage(String langCode) async {
    await LocalDataLayer().setCurrentLanguage(langCode);
    selectLanguage(langCode);
  }
}
