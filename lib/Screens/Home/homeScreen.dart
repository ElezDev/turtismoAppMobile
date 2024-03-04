import 'package:flutter/material.dart';
import 'package:turismoapp/Screens/Splash/splashScreen.dart';
import 'package:turismoapp/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home'),
    Text('Index 1: Profile'),
    Text('Index 2: Settings'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _logout() async {
    await logout();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: colorSecundario,
    appBar: AppBar(
      title: const Text('Home Screen'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: _logout,
        ),
      ],
    ),
    body: Center(
      child: _widgetOptions.elementAt(_selectedIndex),
    ),
    bottomNavigationBar: Container(
      color: Colors.transparent,
      height: 100,
      padding: const EdgeInsets.all(12),
      child: BottomNavigationBar(
        backgroundColor: colorPrincipal,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedIndex == 0 ? colorSecundario : Colors.white, 
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/images/Vector.png',
                width: 24, 
                height: 24, 
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1 ? colorSecundario : Colors.white, 
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/images/favorite.png',
                width: 24,
                height: 24, 
              ),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedIndex == 2 ? colorSecundario : Colors.white, 
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/images/profile.png',
                width: 24, 
                height: 24, 
              ),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: colorSecundario,
        onTap: _onItemTapped,
      ),
    ),
  );
}
}