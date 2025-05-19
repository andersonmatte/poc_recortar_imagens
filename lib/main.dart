import 'package:flutter/material.dart';
import 'package:poc_recortar_imagens/pages/splash_screen.dart';

void main() => runApp(SignatureApp());

class SignatureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poc Recortar Imagens',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
