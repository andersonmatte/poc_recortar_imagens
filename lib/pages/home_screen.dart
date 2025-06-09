import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cortar_imagem_screen.dart';

/// Tela principal do aplicativo após o splash.
///
/// A [HomeScreen] exibe um botão centralizado que permite ao usuário
/// navegar até a tela de recorte de imagem ([CortarImagemScreen]).
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'PoC Recortar Imagem',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CortarImagemScreen()),
            );
          },
          icon: Icon(CupertinoIcons.scissors),
          label: Text('Recortar Imagem'),
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              color: Colors.deepOrangeAccent,
              style: BorderStyle.solid,
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.deepOrangeAccent,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            minimumSize: Size(200, 100),
            textStyle: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
