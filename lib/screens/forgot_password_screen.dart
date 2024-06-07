import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Contraseña'),
      ),
      body: Stack(
        children: [
          // Fondo de pantalla
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/forgot_password_background.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido de la pantalla
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Ingrese su correo electrónico para recibir un enlace de recuperación de contraseña.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.amberAccent, // Ajusta el color según tu preferencia
                    ),
                  ),
                ),
                Spacer(),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8), // Fondo blanco semitransparente para el campo de texto
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.withOpacity(0.8), // Fondo ligeramente transparente
                    foregroundColor: Colors.white, // Color del texto
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    // Acción para enviar el enlace de recuperación de contraseña
                  },
                  child: Text('Enviar Enlace'),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
