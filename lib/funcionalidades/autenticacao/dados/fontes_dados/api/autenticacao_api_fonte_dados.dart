import 'dart:developer';

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

  Future<dynamic>? acaoSolicitarEnvioSenhaAutenticacao(
      String cpf, DateTime dataNascimento);
}

class AutenticacaoApiFonteDadosImplementacao
    implements AutenticacaoApiFonteDados {
  final http.Client client;

  AutenticacaoApiFonteDadosImplementacao({required this.client});

  @override
  Future<AutenticacaoModelo>? acaoAutenticarTokenAutenticacao(
      String clienteToken,
      String clienteSenha,
      String appToken,
      String appSenha) {}

  @override
  Future<AutenticacaoModelo>? acaoLogarAutenticacao(
      String login, String senha) async {
    // final response =
    //     await client.post(Uri.parse('http://apimobile.unisuam.edu.br/login'),
    //         headers: <String, String>{
    //           'Content-Type': 'application/json',
    //           'authentication-key-fixed': 'cf66d3212ae4176f3909d0be33525c70'
    //         },
    //         body: json.encode(<String, String>{
    //           'username': login,
    //           'password': senha,
    //         }));

    final response = await client.post(
        Uri.parse('http://apimobile.unisuam.edu.br/login'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'authentication-key-fixed': 'cf66d3212ae4176f3909d0be33525c70'
        },
        body: <String, String>{
          'username': login,
          'password': senha,
        });

    if (response.statusCode == 200) {
      return AutenticacaoModelo.fromJson(json.decode(response.body));
    } else {
      throw ServidorExcecao();
    }
  }

  @override
  Future<dynamic>? acaoSolicitarEnvioSenhaAutenticacao(
      String cpf, DateTime dataNascimento) async {
    final response = await client.post(
        Uri.parse('http://apimobile.unisuam.edu.br/trocar-senha'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(<String, String>{
          'login': cpf,
          'dataNascimento': dataNascimento.toString(), //usar dateformat
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
    final resposta =
        await SimuladorApi.autenticar(login: clienteToken, senha: clienteSenha);

    //obtem infos de autenticacao do sharedepreferences
    //se datavalidade token for maior que hoje
    //retorna a linha abaixo
    return AutenticacaoModelo.fromJson(json.decode(resposta));
  }
}
