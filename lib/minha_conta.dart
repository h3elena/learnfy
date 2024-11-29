import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'trocarconta.dart';
import 'tela_principal.dart';
import 'chat_screen.dart'; // Importe a tela de chat

class MinhaConta extends StatefulWidget {
  final String email;
  final String senha;
  final String nome;
  final String nivel;

  MinhaConta({
    required this.email,
    required this.senha,
    required this.nome,
    required this.nivel,
  });

  @override
  _MinhaContaState createState() => _MinhaContaState();
}

class _MinhaContaState extends State<MinhaConta> {
  String? emailAtualizado;

  @override
  void initState() {
    super.initState();
    emailAtualizado = widget.email;
  }

  Future<void> _navigateAndUpdateEmail(BuildContext context) async {
    final novoEmail = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TrocarConta()),
    );

    if (novoEmail != null && novoEmail is String) {
      setState(() {
        emailAtualizado = novoEmail;
      });
    }
  }

  Future<void> _clearEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
  }

  Future<void> _logoutAndNavigateToLogin() async {
    await _clearEmail();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TelaPrincipal()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF5AD1D1),
              Color(0xFF0057B2),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.keyboard_backspace_outlined),
                    onPressed: () {
                      _navigateAndUpdateEmail(context);
                    },
                  ),
                  Text('Trocar Conta'),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildUserInfo(),
                    SizedBox(height: 16),
                    _buildHelpSection(),
                    SizedBox(height: 16),
                    _buildFavoritesSection(),
                    SizedBox(height: 16),
                    _buildStudyPlanSection(),
                    SizedBox(height: 16),
                    _buildTourSection(),
                    SizedBox(height: 16),
                    _buildLogoutButton(context),
                  ],
                ),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      color: Colors.blue.shade900,
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(Icons.person, color: Colors.white),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                emailAtualizado ?? widget.email,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                widget.nivel,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          Icon(Icons.arrow_forward_ios, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildHelpSection() {
    return GestureDetector(
      onTap: () {
        // Navegar para a tela de chat
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
      },
      child: _buildSection(
        icon: Icons.contact_support_outlined,
        title: 'Precisa de ajuda?',
        subtitle: 'Entre em contato com o nosso suporte',
      ),
    );
  }

  Widget _buildFavoritesSection() {
    return _buildSection(
      icon: Icons.favorite,
      title: 'Meus favoritos',
      subtitle: 'Ver meus conteúdos mais curtidos',
    );
  }

  Widget _buildStudyPlanSection() {
    return _buildSection(
      icon: Icons.menu_book_outlined,
      title: 'Plano de estudos',
      subtitle: 'Mudar o fluxo de atividades',
    );
  }

  Widget _buildTourSection() {
    return _buildSection(
      icon: Icons.garage_sharp,
      title: 'Fazer o tour',
      subtitle: 'Concluir o tour no app e ganhar 100 pontos',
    );
  }

  Widget _buildSection({required IconData icon, required String title, required String subtitle}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: ElevatedButton(
          onPressed: _logoutAndNavigateToLogin,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.door_back_door_outlined, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Sair do app',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Mais opções',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Icon(Icons.more_vert_rounded),
        ],
      ),
    );
  }
}
