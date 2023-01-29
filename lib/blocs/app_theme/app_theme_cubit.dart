import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_locale_and_theme/config/app_theme.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit()
      :
        // ? Defaults to `AppTheme.light`
        super(AppThemeSelection(theme: AppTheme.light));

  void changeTheme(ThemeData theme) {
    emit(AppThemeSelection(theme: theme));
  }
}
