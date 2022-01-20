import 'package:clubroom/app_config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_data_layer.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.darkTheme);

  void selectTheme(ThemeData themeData) => emit(themeData);

  void getCurrentTheme() async {
    String theme = await LocalDataLayer().getCurrentTheme();
    ThemeData themeData = getTheme(theme);
    selectTheme(themeData);
  }

  Future<void> setCurrentTheme(String theme) async {
    await LocalDataLayer().setCurrentTheme(theme);
    ThemeData themeData = getTheme(theme);
    selectTheme(themeData);
  }

  ThemeData getTheme(String theme) {
    return theme == "dark" ? AppTheme.darkTheme : AppTheme.lightTheme;
  }
}
