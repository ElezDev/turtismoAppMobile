import 'package:flutter/material.dart';
import 'package:turismoapp/Screens/Favorite/favoriteScreen.dart';
import 'package:turismoapp/Screens/Home/home.dart';
import 'package:turismoapp/Screens/User/userScreen.dart';
import 'package:turismoapp/utils/colors.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<MyBottomNavBar> {
  int myCurrentIndex = 0;

  List<Widget> pages = [
    HomePage(),
    // FavoritePage(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 25,
            offset: const Offset(8, 20),
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            selectedItemColor: colorSecundario,
            unselectedItemColor: Colors.black,
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: myCurrentIndex,
        children: pages,
      ),
    );
  }
}
