import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_locale_and_theme/config/app_theme.dart';

import '../blocs/app_locale/app_locale_cubit.dart';
import '../blocs/app_theme/app_theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 18);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Locale & Theme Blocs Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<AppThemeCubit, AppThemeState>(
                builder: (context, state) => Text(
                  state.toString(),
                  style: style,
                  textAlign: TextAlign.center,
                ),
              ),
              BlocBuilder<AppLocaleCubit, AppLocaleState>(
                builder: (context, state) => Text(
                  state.toString(),
                  style: style,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // * Changing the state of both AppThemeCubit and AppLocaleCubit
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AppThemeCubit>(context).changeTheme(
                        AppTheme.light,
                      );
                    },
                    child: const Text('Light Theme'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AppThemeCubit>(context).changeTheme(
                        AppTheme.dark,
                      );
                    },
                    child: const Text('Dark Theme'),
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AppLocaleCubit>(context).changeLocale(
                        const Locale('ar'),
                      );
                    },
                    child: const Text('Ar Locale'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AppLocaleCubit>(context).changeLocale(
                        const Locale('en'),
                      );
                    },
                    child: const Text('En Locale'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
