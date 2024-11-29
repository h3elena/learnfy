import 'package:flutter/material.dart';
import 'tela_principal.dart';
import 'materias.dart';
import 'minha_conta.dart';

void main() {
  runApp(MaterialApp(
    home: MeuApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MeuApp extends StatelessWidget {
     MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TelaPrincipal(),
    );
  }
}


