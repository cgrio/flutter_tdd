import 'dart:convert';

import 'package:tdd_flutter/funcionalidades/usuarios/dados/modelos/usuario_modelo.dart';
import 'package:http/http.dart' as http;
import 'package:tdd_flutter/nucleo/tratamento_erros/excecoes.dart';

abstract class UsuarioApiFonteDados {
  Future<UsuarioModelo>? obterUsuarioCasoUso(int id);
}

class UsuarioApiFonteDadosImplementacao implements UsuarioApiFonteDados {
  final http.Client client;

  UsuarioApiFonteDadosImplementacao({required this.client});

  Future<UsuarioModelo> _obterUsuarioDeApi(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return UsuarioModelo.fromJson(json.decode(response.body));
    } else {
      throw ServidorExcecao();
    }
  }

  @override
  Future<UsuarioModelo>? obterUsuarioCasoUso(int id) {
    _obterUsuarioDeApi('http://localhost:3000/api/usuario/$id');
  }
}
