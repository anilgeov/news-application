
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../controller/splash_controller.dart';
import '../utiles/text_theme.dart';

class SplashScreen extends StatelessWidget {  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    Future.delayed(const Duration(seconds: 3), () {
      splashScreenProvider.setLoading(false);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your splash screen content goes here
            Text(
                "NEWS TODAY",
                style: NewsText.textMain
            ),
            if (splashScreenProvider.isLoading)
              LottieBuilder.asset(
                "assets/animation/Animation - 1718776763003splash.json",
                fit: BoxFit.cover,
                repeat: true,
                height: 150,
                width: 150,
              )
          ],
        ),
      ),
    );
  }
}
