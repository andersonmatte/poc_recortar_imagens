import 'package:flutter/material.dart';
import 'package:poc_recortar_imagens/pages/splash_screen.dart';

/// Função principal que inicia a aplicação.
///
/// Executa o aplicativo [RecortarImagensApp], que define o widget raiz.
void main() => runApp(RecortarImagensApp());

/// Widget principal da aplicação.
///
/// [RecortarImagensApp] configura o título, remove o banner de debug
/// e define a tela inicial como [SplashScreen].
class RecortarImagensApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poc Recortar Imagens',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
