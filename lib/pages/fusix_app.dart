import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusix/bloc/theme_bloc.dart';
import 'package:fusix/pages/splash_screen.dart';

class FusixApp extends StatelessWidget {
  const FusixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (context, themeModeState) {
          return DynamicColorBuilder(
            builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
              ColorScheme? lightScheme;
              ColorScheme? darkScheme;

              if (!kIsWeb) {
                lightScheme = lightDynamic;
                darkScheme = darkDynamic;
              } else {
                lightScheme = ColorScheme.fromSeed(seedColor: Colors.blue);
                darkScheme = ColorScheme.fromSeed(
                  seedColor: Colors.blue,
                  brightness: Brightness.dark,
                );
              }

              return MaterialApp(
                theme: ThemeData(colorScheme: lightScheme, useMaterial3: true),
                darkTheme:
                    ThemeData(colorScheme: darkScheme, useMaterial3: true),
                themeMode: context
                    .read<ThemeCubit>()
                    .themeMode, // Get theme mode from cubit
                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
