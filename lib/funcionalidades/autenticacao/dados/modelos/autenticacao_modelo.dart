import 'dart:io';
import 'dart:developer' as developer;
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/entidades/autenticacao_entidade.dart';

class AutenticacaoModelo extends AutenticacaoEntidade {
  AutenticacaoModelo(
      {required String login,
      required String senha,
      String? appSenha,
      String? appToken,
      String? clienteToken,
      String? clientSenha,
      String? dataExpiracaoToken})
      : super(
            login: login,
            senha: senha,
            appSenha: appSenha,
            appToken: appToken,
            clienteToken: clienteToken,
            clientSenha: clientSenha,
            dataExpiracaoToken: dataExpiracaoToken);

  factory AutenticacaoModelo.fromJson(Map<String, dynamic> json) {
    AutenticacaoModelo auth = AutenticacaoModelo(
        // login: json['login'],
        // senha: json['senha'],
        // appSenha: json['appSenha'],
        // appToken: json['appToken'],
        // clienteToken: json['clienteToken'],
        // clientSenha: json['clientSenha']);
        login: "${json['authentication']['authentication-login']}",
        senha: "${json['authentication']['authentication-key']}",
        clienteToken: "${json['authentication']['authentication-login']}");
    return auth;
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'senha': senha,
      'appSenha': appSenha,
      'appToken': appToken,
      'clienteToken': clienteToken,
      'clientSenha': clientSenha
    };
  }
}
