import 'package:flutter/material.dart';

class MangaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mangas'),
      ),
      body: Center(
        child: Text('Lista de Mangas', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
