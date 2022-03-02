import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dados/modelos/autenticacao_modelo.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/excecoes.dart';

const AUTENTICACAO_CACHE = 'AUTENTICACAO_CACHE';

abstract class AutenticacaoLocalFonteDados {
  Future<void>? acaoGuardarAutenticacaoCache(
      AutenticacaoModelo autenticaoModelo);
  Future<AutenticacaoModelo>? acaoObterAutenticacaoCache();
  Future<void>? acaoApagarAutenticacaoCache();
}

class AutenticacaoLocalFonteDadosImplementacao
    implements AutenticacaoLocalFonteDados {
  final SharedPreferences sharedPreferences;
  AutenticacaoLocalFonteDadosImplementacao({required this.sharedPreferences});

  @override
  Future<bool>? acaoGuardarAutenticacaoCache(
      AutenticacaoModelo autenticaoModelo) async {
    return sharedPreferences.setString(
        AUTENTICACAO_CACHE, json.encode(autenticaoModelo.toJson()));
  }

  @override
  Future<AutenticacaoModelo>? acaoObterAutenticacaoCache() async {
    final jsonString = sharedPreferences.getString(AUTENTICACAO_CACHE);
    if (jsonString != null) {
      return Future.value(AutenticacaoModelo.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExcecao();
    }
  }

  @override
  Future<void>? acaoApagarAutenticacaoCache() async {
    dynamic apagar = await sharedPreferences.remove(AUTENTICACAO_CACHE);
  }
}
