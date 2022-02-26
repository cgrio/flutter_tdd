import 'package:tdd_flutter/funcionalidades/autenticacao/dados/modelos/autenticacao_modelo.dart';

abstract class SimuladorApi {
  static Future<AutenticacaoModelo?> autenticar(
      {required String login, required String senha}) {
    return Future.delayed(const Duration(seconds: 3), () {
      return AutenticacaoModelo(
          login: "alessandro.correia@unisuam.edu.br",
          senha: 'focoDeterminacao',
          appSenha: "sfsfssfsdfsdsdfsdfsfsdfsfsf",
          appToken: "safsdfsffdsfsfsdfsfsffsfsfsfsdff",
          clientSenha: "sdfsdafsdfsdfsdfsdfsdf",
          clienteToken: "sdfsdfsdfsdfsdfdsafdf",
          dataExpiracaoToken: "2023-12-31 00:00:00.000");
    });
  }
}
