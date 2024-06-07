import 'package:flutter/material.dart';
import '../ultis/alert_utils.dart'; // Importa el archivo de utilidades

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showNoConnectionAlert(context); // Muestra la alerta de no conexión al iniciar la pantalla
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime LEgacy'),
        backgroundColor: Colors.transparent, // AppBar transparente
        elevation: 0, // Sin sombra
      ),
      body: Stack(
        children: [
          // Fondo de pantalla
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_background.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido de la pantalla
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Bienvenido a Anime LEgacy',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent.withOpacity(0.8), // Fondo ligeramente transparente
                          foregroundColor: Colors.white, // Color del texto
                          textStyle: TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24), // Botones más grandes
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/anime');
                        },
                        child: Text('Ver Anime'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.tealAccent.withOpacity(0.8), // Fondo ligeramente transparente
                          foregroundColor: Colors.black, // Color del texto
                          textStyle: TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24), // Botones más grandes
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/manga');
                        },
                        child: Text('Ver Mangas'),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Destacados',
                      style: TextStyle(fontSize: 28, color: Colors.amber),
                    ),
                  ),
                  SizedBox(height: 20),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      _buildCard('Anime Destacado', 'assets/images/example.webp'),
                      _buildCard('Manga Destacado', 'assets/images/example.webp'),
                      _buildCard('Otros', 'assets/images/example.webp'),
                      // Añadir más cards si es necesario
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menú'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Anime'),
              onTap: () {
                Navigator.pushNamed(context, '/anime');
              },
            ),
            ListTile(
              title: Text('Mangas'),
              onTap: () {
                Navigator.pushNamed(context, '/manga');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String imagePath) {
    return Card(
      color: Colors.white.withOpacity(0.8), // Contenedor ligeramente transparente
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(imagePath, fit: BoxFit.cover, height: 100, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Texto más grande
            ),
          ),
        ],
      ),
    );
  }
}
