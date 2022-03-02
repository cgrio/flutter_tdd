import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/apresentacao/bloc/autenticacao_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    this.mensagem,
  }) : super(key: key);
  final String? mensagem;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AutenticacaoBloc>(context);

    void _autenticar() {
      final sigInEvent = LoginEvent(
          login: _loginController.text, senha: _senhaController.text);
      bloc.add(sigInEvent);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
                child: Text("Mensagem"),
              ),
              TextField(
                controller: _loginController,
              ),
              SizedBox(height: 40, child: Text(widget.mensagem ?? "Nada")),
              TextField(
                obscureText: true,
                controller: _senhaController,
              ),
              const SizedBox(
                height: 40,
                child: Text("Mensagem"),
              ),
              ElevatedButton(onPressed: _autenticar, child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
