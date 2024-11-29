import 'package:flutter/material.dart';

class Matematica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Matemática e suas tecnologias',
          style: TextStyle(color: Colors.white), // Título da AppBar em branco
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF5AD1D1), // Cor clara (como na tela MinhaConta)
              Color(0xFF0057B2), // Cor escura (como na tela MinhaConta)
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Centraliza o conteúdo
              children: [
                buildSubjectButton('Matemática e suas tecnologias'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubjectButton(String subject) {
    return Container(
      width: 500,
      height: 200,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.shade900, // Cor de fundo do botão
      ),
      child: ElevatedButton(
        onPressed: () {
          // Ação do botão (opcional)
        },
        child: Text(
          subject,
          style: TextStyle(fontSize: 24, color: Colors.white), // Texto branco
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Fundo transparente para o degradê
          elevation: 0, // Sem sombra
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Bordas circulares
          ),
        ),
      ),
    );
  }
}
