import 'package:flutter/material.dart';
import 'ciencia.dart';
import 'humana.dart';
import 'linguagem.dart';
import 'matematica.dart';
import 'redacao.dart';

class Materias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF5AD1D1), // Cor clara (similar à tela MinhaConta)
              Color(0xFF0057B2), // Cor escura (similar à tela MinhaConta)
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(context, 'Ciências da Natureza', Ciencia()),
              buildButton(context, 'Ciências Humanas', Humana()),
              buildButton(context, 'Linguagens e Tecnologias', Linguagem()),
              buildButton(context, 'Matemática e Tecnologias', Matematica()),
              buildButton(context, 'Redação', Redacao()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String label, Widget page) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8, // Utiliza 80% da largura disponível
      height: 125,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.shade900,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(
          label,
          style: TextStyle(fontSize: 20, color: Colors.white), // Títulos em branco
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Background transparente para ver o degradê
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
