import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dados/modelos/usuario_modelo.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/excecoes.dart';

abstract class UsuarioLocalFonteDados {
  Future<UsuarioModelo> obterUltimoUsuario();

  Future<void> cacheUsuario(UsuarioModelo usuarioDoCache);
}

const kCacheUsuario = 'CACHE_USUARIO';

class UsuarioLocalFonteDadosImplementacao implements UsuarioLocalFonteDados {
  final SharedPreferences sharedPreferences;

  UsuarioLocalFonteDadosImplementacao({required this.sharedPreferences});

  @override
  Future<UsuarioModelo> obterUltimoUsuario() async {
    final jsonString = sharedPreferences.getString(kCacheUsuario);
    // Future which is immediately completed
    if (jsonString != null) {
      return Future.value(UsuarioModelo.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExcecao();
    }
  }

  @override
  Future<void> cacheUsuario(UsuarioModelo usuarioDoCache) {
    return sharedPreferences.setString(
      kCacheUsuario,
      json.encode(usuarioDoCache.toJson()),
    );
  }
}
