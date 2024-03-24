import 'package:flutter/material.dart';
import 'package:turismoapp/Screens/Auth/loginScrenn.dart';
import 'package:turismoapp/Screens/Home/homeScreen.dart';
import 'package:turismoapp/Screens/Splash/splashScreen.dart';
import 'package:turismoapp/Screens/User/userScreen.dart';
import 'package:turismoapp/utils/colos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      themeMode: ThemeMode.system, // Toma el tema del sistema.
      darkTheme: ThemeData.dark().copyWith(
        
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(), 
        '/login': (context) => const LoginScreen(), 
        '/profile': (context) => UserScreen(), 
      },
    );
  }
}
