import 'package:flutter/material.dart';

class AnimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime'),
      ),
      body: Center(
        child: Text('Lista de Anime', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
