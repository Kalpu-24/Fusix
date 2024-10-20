// presentation/pages/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'responsive_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      useImmersiveMode: true,
      duration: const Duration(milliseconds: 2000),
      nextScreen: const ResponsiveLayout(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      splashScreenBody: Center(
        child: Lottie.asset(
          "assets/lottie/FusixSplash.json",
          repeat: false,
          delegates: LottieDelegates(
            values: [
              ValueDelegate.strokeColor(
                const ['**'],
                value: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
