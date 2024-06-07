import 'package:flutter/material.dart';
import 'package:anime_legacy/services/api_routes.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de pantalla
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_background.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido del login
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Text(
                        'Bienvenido a Anime LEgacy',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent, // Ajusta el color según tu preferencia
                        ),
                      ),
                      Text(
                        'By Leo Escobar',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent.withOpacity(0.8), // Fondo ligeramente transparente
                        foregroundColor: Colors.white, // Color del texto
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return LoginRegisterModal();
                          },
                        );
                      },
                      child: Text('Iniciar Sesión'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent.withOpacity(0.8), // Fondo ligeramente transparente
                        foregroundColor: Colors.black, // Color del texto
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home'); // O otra ruta que definas para invitados
                      },
                      child: Text('Continuar como Invitado'),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class LoginRegisterModal extends StatefulWidget {
  @override
  _LoginRegisterModalState createState() => _LoginRegisterModalState();
}

class _LoginRegisterModalState extends State<LoginRegisterModal> {
  bool showLogin = true;
  final ApiRoutes apiRoutes = ApiRoutes();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> authenticate() async {
    try {
      final email = emailController.text;
      final password = passwordController.text;
      final user = await apiRoutes.authenticate(email, password);
      if (user != null) {
        Navigator.pushNamed(context, '/home');
      } else {
        _showAlertDialog('Error', 'Correo o contraseña incorrectos');
      }
    } catch (e) {
      _showAlertDialog('Error', e.toString());
    }
  }

  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                showLogin = true;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: showLogin ? Colors.blueAccent : Colors.grey,
              foregroundColor: Colors.white,
            ),
            child: Text('Iniciar Sesión'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                showLogin = false;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: !showLogin ? Colors.blueAccent : Colors.grey,
              foregroundColor: Colors.white,
            ),
            child: Text('Registrarse'),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (showLogin)
              Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo o Usuario',
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: authenticate,
                    child: Text('Iniciar Sesión'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: Text('¿Olvidaste tu contraseña?'),
                  ),
                ],
              )
            else
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Correo',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Fecha de Nacimiento',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Sexo',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Acción de registrarse
                    },
                    child: Text('Registrarse'),
                  ),
                ],
              ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cerrar'),
        ),
      ],
    );
  }
}
