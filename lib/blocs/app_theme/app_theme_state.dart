part of 'app_theme_cubit.dart';

@immutable
abstract class AppThemeState {
  final ThemeData theme;

  const AppThemeState({
    required this.theme,
  });
}

class AppThemeSelection extends AppThemeState {
  const AppThemeSelection({required super.theme});

  @override
  String toString() => 'AppThemeSelection\n(${theme.brightness.name})';
}
