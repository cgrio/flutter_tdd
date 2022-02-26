import 'package:tdd_flutter/funcionalidades/autenticacao/dados/modelos/autenticacao_modelo.dart';
import 'package:http/http.dart' as http;
import 'package:tdd_flutter/nucleo/simulador_api.dart';
import 'dart:convert';

import 'package:tdd_flutter/nucleo/tratamento_erros/excecoes.dart';

abstract class AutenticacaoApiFonteDados {
  Future<AutenticacaoModelo>? acaoLogarAutenticacao(String login, String senha);
  Future<AutenticacaoModelo>? acaoObterDoSimuladorAutenticacao(
      String clienteToken, String clienteSenha);

  Future<AutenticacaoModelo>? acaoAutenticarTokenAutenticacao(
      String clienteToken,
      String clienteSenha,
      String appToken,
      String appSenha);

  Future<dynamic>? acaoSolicitarEnvioSenhaAutenticacao(String login);
}

class AutenticacaoApiFonteDadosImplementacao
    implements AutenticacaoApiFonteDados {
  final http.Client client;

  AutenticacaoApiFonteDadosImplementacao(this.client);

  @override
  Future<AutenticacaoModelo>? acaoAutenticarTokenAutenticacao(
      String clienteToken,
      String clienteSenha,
      String appToken,
      String appSenha) {}

  @override
  Future<AutenticacaoModelo>? acaoLogarAutenticacao(
      String login, String senha) async {
    final response = await client.post(Uri.parse('/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(<String, String>{
          'login': login,
          'senha': senha,
        }));
    if (response.statusCode == 200) {
      return AutenticacaoModelo.fromJson(json.decode(response.body));
    } else {
      throw ServidorExcecao();
    }
  }

  @override
  Future<dynamic>? acaoSolicitarEnvioSenhaAutenticacao(String login) async {
    final response = await client.post(Uri.parse('/auth/trocar-senha'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(<String, String>{
          'login': login,
        }));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ServidorExcecao();
    }
  }

  @override
  Future<AutenticacaoModelo>? acaoObterDoSimuladorAutenticacao(
      String clienteToken, String clienteSenha) async {
    return AutenticacaoModelo.fromJson(json.decode(
        SimuladorApi.autenticar(login: clienteToken, senha: clienteSenha)));
  }
}
