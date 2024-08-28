import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/bottom_nav_controller.dart';

class BottombarNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black,spreadRadius: 2,blurRadius: 1)],
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff04a97a)),
          child: BottomNavigationBar(


              currentIndex:
              Provider.of<BottomNavController>(context).selectedIndex,
              onTap: Provider.of<BottomNavController>(context, listen: false)
                  .onItemTap,


              elevation: 0,
              backgroundColor: const Color(0xff04a97a),
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 25,
              ),
              unselectedIconTheme: const IconThemeData(
                size: 25,
              ),
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category),
                    label: "Category"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search_outlined),
                    label: "Search"),
              ]),
        ),
      ),
    );
  }
}