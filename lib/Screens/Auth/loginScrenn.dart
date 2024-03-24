import 'package:flutter/material.dart';
import 'package:turismoapp/services/loginService.dart';
import 'package:turismoapp/utils/colos.dart';
import 'package:turismoapp/widgets/CustomButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  Future<void> _login() async {
    await _authService.login(
        emailController.text, passwordController.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrincipal,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _header(context),
            const SizedBox(
              height: 20,
            ), //
            TextField(
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              autocorrect: true,
              cursorColor: colorTertiario,
              controller: emailController,
              decoration: InputDecoration(
                hoverColor: colorTertiario,
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.person),
                // labelStyle: TextStyle(color: colorSecundario),
              ),
            ),

            const SizedBox(height: 16),
            TextField(
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              obscureText: true,
              autocorrect: true,
              cursorColor: colorTertiario,
              controller: passwordController,
              decoration: InputDecoration(
                hoverColor: colorTertiario,
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.password),
                // labelStyle: const TextStyle(color: colorTertiario),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: CustomButton(
                text: 'Login',
                onPressed: _login,
                backgroundColor: colorSecundario,
              ),
            )
          ],
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: colorSecundario,
          ),
        ),
        Text(
          "Enter your credential to login",
          style: TextStyle(
            color: colorTertiario,
          ),
        ),
      ],
    );
  }
}
