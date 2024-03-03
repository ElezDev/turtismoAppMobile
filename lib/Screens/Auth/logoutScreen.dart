// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:turismoapp/Screens/Splash/splashScreen.dart';
// Future<void> logoutApp(BuildContext context) async {
//   logout();
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: Colors.white.withOpacity(0.8),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Image.asset(
//             //   "assets/animations/logo-3.gif",
//             //   width: 50,
//             //   height: 50,
//             // ),
//             const SizedBox(height: 16),
//             const SizedBox(height: 16),
//             const Text(
//               "Cerrando sesión...",
//               // style: kTlightpro,
//             ),
//           ],
//         ),
//       );
//     },
//   );

//   await Future.delayed(const Duration(seconds: 1)); // Espera 1 segundo

//   Navigator.of(context).pop(); // Cierra el diálogo

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.remove('token');

//   Navigator.pushReplacementNamed(context, '/login');
// }
