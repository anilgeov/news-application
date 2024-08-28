import 'package:flutter/material.dart';
import 'package:newsapp/view/bottom_bar/bottombar.dart';
import 'package:newsapp/view/splashscreen.dart';
import 'package:provider/provider.dart';

import 'controller/bottom_nav_controller.dart';
import 'controller/category_controler.dart';
import 'controller/homescreen_controller.dart';
import 'controller/search_sreen_controller.dart';
import 'controller/splash_controller.dart';

void main() {
  runApp(NewsApp());
}
class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SplashScreenProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeScreenController(),
          ),
          ChangeNotifierProvider(
            create: (context) => SearchScreenController(),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomNavController(),
          ),
          ChangeNotifierProvider(
            create: (context) => CategoryController(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Consumer<SplashScreenProvider>(
            builder: (context, splashScreenProvider, widget) {
              return splashScreenProvider.isLoading
                  ? SplashScreen()
                  : BottombarNews(); // Replace with your home screen
            },
          ),
        ));
  }
}