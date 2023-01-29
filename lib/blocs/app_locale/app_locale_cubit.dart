// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'app_locale_state.dart';

class AppLocaleCubit extends Cubit<AppLocaleState> {
  AppLocaleCubit()
      :
        // ? Defaults to `Locale('ar')`
        super(const AppLocaleSelection(locale: Locale('ar')));

  void changeLocale(Locale locale) {
    emit(AppLocaleSelection(locale: locale));
  }
}
