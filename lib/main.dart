import 'package:flutter/material.dart';
import 'package:turismoapp/Screens/Auth/loginScrenn.dart';
import 'package:turismoapp/Screens/Home/bottomNavigationBar.dart';
import 'package:turismoapp/Screens/Splash/onboarding.dart';
import 'package:turismoapp/Screens/Splash/splashScreen.dart';
import 'package:turismoapp/Screens/User/userScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Popayan Turims',
      themeMode: ThemeMode.system, // Toma el tema del sistema.
      darkTheme: ThemeData.dark().copyWith(
        
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const MyBottomNavBar(), 
        '/login': (context) => const LoginScreen(), 
        '/profile': (context) => UserScreen(), 
        '/onboarding': (context) => const OnboardingScreen(), // Ruta para el onboarding

      },
    );
  
  }
}
