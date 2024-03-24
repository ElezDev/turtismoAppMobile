import 'package:flutter/material.dart';
import 'package:turismoapp/Screens/Splash/splashScreen.dart';
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

 Future<void> _logout() async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        
        title: Text('Cerrando sesión...'),
        content: Container(
          width: 30,  // Ancho deseado del indicador de progreso
          height: 30, // Alto deseado del indicador de progreso
          // child: CircularProgressIndicator(),
        ),
      );
    },
  );

  // Agregar un retraso de 2 segundos antes de cerrar la sesión
  await Future.delayed(Duration(seconds: 2));

  // Cerrar sesión después del retraso
  await logout();

  // Navegar de vuelta a la pantalla de inicio de sesión
  Navigator.pushReplacementNamed(context, '/login');
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
        SizedBox(
            height:
                20), // Espacio entre la parte superior y la imagen de perfil
        CircleAvatar(
          radius: 50,

          // Ejemplo: backgroundImage: AssetImage('assets/images/profile_image.png'),
        ),
        SizedBox(
            height:
                20), // Espacio entre la imagen de perfil y los datos del usuario
        Text(
          'Nombre: ${_userData!['name']}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10), // Espacio entre el nombre y el correo electrónico
        Text(
          'Correo electrónico: ${_userData!['email']}',
          style: TextStyle(fontSize: 16),
        ),

        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: _logout,
        ),
      ],
    );
  }
}
