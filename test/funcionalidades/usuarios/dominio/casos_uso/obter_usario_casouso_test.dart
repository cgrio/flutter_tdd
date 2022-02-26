import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dominio/casos_uso/obter_usuario_casouso.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dominio/entidades/usuario_entidade.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dominio/parametros/usuario_parametros.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dominio/repositorios/usuario_repositorio.dart';

import 'obter_usario_casouso_test.mocks.dart';

@GenerateMocks([UsuarioRepositorio])
void main() {
  late ObterUsuarioCasoUso casouso;
  late MockUsuarioRepositorio mockUsuarioRepositorio;
  late int tId;
  late UsuarioEntidade tUsuarioEntidade;

  setUp(() {
    mockUsuarioRepositorio = MockUsuarioRepositorio();
    casouso = ObterUsuarioCasoUso(mockUsuarioRepositorio);
    tId = 1;
    tUsuarioEntidade = const UsuarioEntidade(id: 1, nome: 'Alessandro');
  });

  test('deverá trazer o usuarioRepositorio', () async {
    when(mockUsuarioRepositorio.obterUsuarioCasoUso(any))
        .thenAnswer((_) async => Right(tUsuarioEntidade));
    final result = await casouso(UsuarioParametros(id: tId));
    expect(result, equals(Right(tUsuarioEntidade)));
    verify(mockUsuarioRepositorio.obterUsuarioCasoUso(tId));
    verifyNoMoreInteractions(mockUsuarioRepositorio);
  });
}
