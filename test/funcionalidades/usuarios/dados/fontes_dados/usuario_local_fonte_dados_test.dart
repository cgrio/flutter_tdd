import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dados/fontes_dados/local/usuario_local_fonte_dados.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dados/modelos/usuario_modelo.dart';

import '../../../../acessorios/acessorio_leitura_json.dart';
import 'usuario_local_fonte_dados_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late UsuarioLocalFonteDadosImplementacao fonteDados;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    fonteDados = UsuarioLocalFonteDadosImplementacao(
        sharedPreferences: mockSharedPreferences);
  });

  group('getLastNumberTrivia', () {
    final tUsuarioModelo = UsuarioModelo.fromJson(
        json.decode(acessoLeituraJson('usuario_padrao.json')));

    test(
      'should return Usuario from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(acessoLeituraJson('usuario_padrao.json'));
        // act
        final result = await fonteDados.obterUltimoUsuario();
        // assert
        verify(mockSharedPreferences.getString('CACHE_USUARIO'));
        expect(result, equals(tUsuarioModelo));
      },
    );
  });
}
