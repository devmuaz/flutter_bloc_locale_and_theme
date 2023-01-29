// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_locale/app_locale_cubit.dart';
import '../blocs/app_theme/app_theme_cubit.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppLocaleCubit>(create: (_) => AppLocaleCubit()),
        BlocProvider<AppThemeCubit>(create: (_) => AppThemeCubit()),
      ],
      // * Your app will be rebuilt each time you emit new state of
      // * AppThemeState in your AppThemeCubit
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) => _MaterialApp(theme: state.theme),
      ),
    );
  }
}

class _MaterialApp extends StatelessWidget {
  final ThemeData theme;

  const _MaterialApp({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLocaleCubit, AppLocaleState>(
      listener: (context, state) {
        // * Listen for app locale changes to do other things like updating
        // * the network interceptor locale.
        debugPrint(
          'AppLocaleCubit: selected locale (${state.locale.languageCode})',
        );
      },
      // * Your app will be rebuilt each time you emit new state of
      // * AppLocaleState in your AppLocaleCubit
      builder: (context, state) {
        // * You can use the selected locale by the bloc anywhere in your app
        // * like so:
        final locale = state.locale;

        return MaterialApp(
          theme: theme,
          home: const HomePage(),
        );
      },
    );
  }
}
