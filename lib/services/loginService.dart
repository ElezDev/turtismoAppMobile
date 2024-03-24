import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turismoapp/api/constantes.dart';
import 'package:turismoapp/widgets/CustomErrorWidget.dart';

class AuthService {
  Future<void> login(
      String email, String password, BuildContext context) async {
    final Map<String, String> data = {
      'email': email,
      'password': password,
    };

    final response = await http.post(
      Uri.parse(loginUrl),
      body: data,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      String token = responseData['token'];
      await _saveToken(token);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => const CustomErrorCard(
          errorMessage:
              'El correo electrónico o la contraseña son incorrectos.',
        ),
      );
    }
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

 
}
 Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token') ?? '';
  }
