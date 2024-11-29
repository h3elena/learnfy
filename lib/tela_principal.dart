import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navegacao.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final senhaController = TextEditingController(text: 'emilys1!');
  final nomeController = TextEditingController(text: 'Helena Pastório Dambrós');
  final nivelController = TextEditingController(text: 'Nível 5');
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  // Carrega o e-mail salvo nos SharedPreferences
  Future<void> _loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    if (email != null) {
      emailController.text = email; // Carrega o e-mail salvo se existir
    } else {
      emailController.clear(); // Limpa o campo caso não tenha e-mail salvo
    }
  }

  // Salva o e-mail nos SharedPreferences
  Future<void> _saveEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email); // Salva o e-mail
  }

  // Limpa o e-mail dos SharedPreferences
  Future<void> _clearEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email'); // Remove o e-mail salvo
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book, color: Colors.white, size: 40), // Ícone de livro
                    SizedBox(width: 10),
                    Text(
                      "Learnfy",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100.0),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: emailController,
                                style: TextStyle(color: Colors.blue.shade900),
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "Insira seu email",
                                  labelStyle: TextStyle(color: Colors.blue.shade900),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(Icons.email, color: Colors.blue.shade900),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) return "Preenchimento Obrigatório";
                                  if (!value.contains("@")) return "Email não é válido";
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: senhaController,
                                obscureText: true,
                                style: TextStyle(color: Colors.blue.shade900),
                                decoration: InputDecoration(
                                  labelText: "Senha",
                                  hintText: "Insira sua senha",
                                  labelStyle: TextStyle(color: Colors.blue.shade900),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(Icons.password, color: Colors.blue.shade900),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) return "Preenchimento Obrigatório";
                                  if (value.length < 6 || value.length > 8) return "Senha deve ter de 6 a 8 caracteres";
                                  if (!RegExp(r'[a-zA-Z]').hasMatch(value)) return "A senha deve conter pelo menos uma letra";
                                  if (!RegExp(r'\d').hasMatch(value)) return "A senha deve conter pelo menos um número";
                                  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) return "A senha deve conter pelo menos um caractere especial";
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });

                      Future.delayed(Duration(seconds: 3), () {
                        setState(() {
                          isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Formulário enviado")),
                        );

                        // Salva o e-mail antes de navegar
                        _saveEmail(emailController.text);

                        // Navegando para a Navegacao com os dados do login
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Navegacao(
                              email: emailController.text,
                              senha: senhaController.text,
                              nome: nomeController.text,
                              nivel: nivelController.text,
                            ),
                          ),
                        );
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.blue.shade900),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                  ),
                  child: Text(
                    "Enviar",
                    style: TextStyle(color: Colors.blue.shade900),
                  ),
                ),
                SizedBox(height: 20.0),
                if (isLoading) CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
