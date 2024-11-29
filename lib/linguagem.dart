import 'package:flutter/material.dart';

class Linguagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Linguagens, Códigos e suas Tecnologias',
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
              children: [
                buildSubjectButton('Português'),
                buildSubjectButton('Literatura'),
                buildSubjectButton('Língua Estrangeira'),
                buildSubjectButton('Artes'),
                buildSubjectButton('Educação Física'),
                buildSubjectButton('Tecnologias da Informação e Comunicação'),
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
        color: Colors.blue.shade900,
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
          backgroundColor: Colors.transparent, // Fundo transparente para ver o degradê
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
