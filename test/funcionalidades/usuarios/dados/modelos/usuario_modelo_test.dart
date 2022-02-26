import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dados/modelos/usuario_modelo.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dominio/entidades/usuario_entidade.dart';

import '../../../../acessorios/acessorio_leitura_json.dart';

void main() {
  const tUsuarioModelo = UsuarioModelo(id: 1, nome: "Alessandro");

  test('Deve ser uma subclasse de UsuarioEntidade', () async {
    expect(tUsuarioModelo, isA<UsuarioEntidade>());
  });

  group('Lendo de Json', () {
    test('Tem que retornar um modelo válido quando o Json tem um id inteiro',
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(acessoLeituraJson('usuario_padrao.json'));
      final result = UsuarioModelo.fromJson(jsonMap);
      expect(result, tUsuarioModelo);
    });
  });

  group('Convertendo para Json', () {
    test('Tem que retornar um Json Map tem um UsuarioModelo', () async {
      final result = tUsuarioModelo.toJson();
      final resultadoEsperadoJsonMap = {"id": 1, "nome": "Alessandro"};

      expect(result, resultadoEsperadoJsonMap);
    });
  });
}
