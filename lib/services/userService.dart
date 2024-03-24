import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:turismoapp/api/constantes.dart';
import 'package:turismoapp/services/loginService.dart';

class UserService {

  UserService();

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      String token = await getToken();
      final response = await http.get(
        Uri.parse(datosUser),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return jsonData['user']; // Retorna directamente el mapa de usuario
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
