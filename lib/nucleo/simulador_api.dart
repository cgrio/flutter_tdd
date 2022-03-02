import 'package:flutter/services.dart' show rootBundle;

abstract class SimuladorApi {
  static Future<String> autenticar(
      {required String login, required String senha}) {
    return Future.delayed(const Duration(seconds: 2), () async {
      //print(await _obterArquivoJson('/auth/login'));
      return _obterArquivoJson('/auth/login');
    });
  }

  static Future<String> _obterArquivoJson(rota) async {
    switch (rota) {
      case '/auth/login':
        return await rootBundle
            .loadString('assets/arquivos_json/auth_login.json');
    }
    return 'aa';
  }
}
