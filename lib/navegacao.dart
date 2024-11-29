import 'package:flutter/material.dart';
import 'minha_conta.dart';
import 'materias.dart';

class Navegacao extends StatefulWidget {
  final String email;
  final String senha;
  final String nome;
  final String nivel;

  Navegacao({required this.email, required this.senha, required this.nome, required this.nivel});

  @override
  _NavegacaoState createState() => _NavegacaoState();
}

class _NavegacaoState extends State<Navegacao> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.add(Materias());
    _pages.add(MinhaConta(
      email: widget.email,
      senha: widget.senha,
      nome: widget.nome,
      nivel: widget.nivel,
    ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Matérias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Minha Conta',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
