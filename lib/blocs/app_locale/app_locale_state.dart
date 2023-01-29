part of 'app_locale_cubit.dart';

@immutable
abstract class AppLocaleState {
  final Locale locale;

  const AppLocaleState({
    required this.locale,
  });
}

class AppLocaleSelection extends AppLocaleState {
  const AppLocaleSelection({required super.locale});

  @override
  String toString() => 'AppLocaleSelection\n(${locale.languageCode})';
}
