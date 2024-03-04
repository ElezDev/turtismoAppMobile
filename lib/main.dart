import 'package:flutter/material.dart';
import 'package:turismoapp/Screens/Auth/loginScrenn.dart';
import 'package:turismoapp/Screens/Home/homeScreen.dart';
import 'package:turismoapp/Screens/Splash/onboarding.dart';
import 'package:turismoapp/Screens/Splash/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Your App',
  theme: ThemeData(
    backgroundColor: Color(0xFF303030)
  ),
  home: const SplashScreen(),
  routes: {
    '/home': (context) => const HomeScreen(), 
    '/login': (context) => const LoginScreen(), 
    '/onboarding': (context) => const OnboardingScreen(), // Ruta para el onboarding
  },
);

  }
}


