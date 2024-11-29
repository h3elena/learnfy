import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _messages = [];
  bool _hasSentMessage = false;

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _messages.add("Mensagem automática de suporte: Como posso ajudar?");
        _hasSentMessage = true;
      });
      _controller.clear();
    }
  }

  void _showContactOptions(String option) {
    String message = '';
    if (option == 'chat') {
      message = "Você pode iniciar um bate-papo com um atendente!";
    } else if (option == 'phone') {
      message = "Ligue para o número de atendimento: (54) 3381-4678";
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Opção Selecionada"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Fechar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat de Suporte"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF87E6E6), // Azul claro
              Color(0xFF66A7FF), // Azul mais claro
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Fundo branco para as mensagens
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      _messages[index],
                      style: TextStyle(
                        color: Colors.black, // Letras pretas
                        fontSize: 16.0,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Fundo branco para o campo de texto
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Digite sua mensagem",
                          border: InputBorder.none, // Remove a borda do campo
                          contentPadding: EdgeInsets.all(12.0), // Espaçamento interno
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _sendMessage,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
            if (_hasSentMessage) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Se precisar de mais ajuda, entre em contato com nosso suporte:",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        _showContactOptions('chat');
                      },
                      child: Text("Bate-papo com atendente"),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        _showContactOptions('phone');
                      },
                      child: Text("Ligar para atendimento"),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
