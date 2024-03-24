import 'package:flutter/material.dart';
import 'package:turismoapp/services/userService.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    UserService userService = UserService();
    Map<String, dynamic>? userData = await userService.getUserData();
    setState(() {
      _userData = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _userData != null
            ? _buildUserDataWidget()
            : CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildUserDataWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20), // Espacio entre la parte superior y la imagen de perfil
        CircleAvatar(
          radius: 50,

          // Ejemplo: backgroundImage: AssetImage('assets/images/profile_image.png'),
        ),
        SizedBox(height: 20), // Espacio entre la imagen de perfil y los datos del usuario
        Text(
          'Nombre: ${_userData!['name']}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10), // Espacio entre el nombre y el correo electrónico
        Text(
          'Correo electrónico: ${_userData!['email']}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}



