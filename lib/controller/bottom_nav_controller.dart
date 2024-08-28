
import 'package:flutter/material.dart';

import '../view/category_screens/sreen_category.dart';
import '../view/homescreen/home_sreen.dart';
import '../view/search_screen/search_screen.dart';

class BottomNavController with ChangeNotifier{

  int selectedIndex = 1;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    HomeScreen(),
    Category_Screen(),
    SearchNewsScreen()
  ];

}
