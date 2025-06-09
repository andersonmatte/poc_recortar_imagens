import 'package:flutter/material.dart';
import 'home_screen.dart';

/// Tela inicial do aplicativo exibida ao iniciar.
///
/// A [SplashScreen] mostra uma imagem por 3 segundos antes de
/// redirecionar automaticamente o usuário para a [HomeScreen].
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// Estado da [SplashScreen].
///
/// Gerencia o temporizador de 3 segundos e navega para a [HomeScreen].
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Atraso de 3 segundos antes de redirecionar para a tela principal.
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Image.asset('assets/images/gonzo.png'),
      ),
    );
  }
}
