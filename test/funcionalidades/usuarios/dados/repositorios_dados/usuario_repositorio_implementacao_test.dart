import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dados/fontes_dados/api/usuario_api_fonte_dados.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dados/fontes_dados/local/usuario_local_fonte_dados.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dados/modelos/usuario_modelo.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dados/repositorios_dados/usuario_repositorio_implementacao.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dominio/entidades/usuario_entidade.dart';
import 'package:tdd_flutter/nucleo/plataforma/informacao_rede.dart';

import 'usuario_repositorio_implementacao_test.mocks.dart';

@GenerateMocks([UsuarioApiFonteDados, UsuarioLocalFonteDados, InformacaoRede])
void main() {
  late UsuarioRepositorioImplementacao repository;
  late MockUsuarioApiFonteDados mockUsuarioApiFonteDados;
  late MockUsuarioLocalFonteDados mockUsuarioLocalFonteDados;
  late MockInformacaoRede mockInformacaoRede;
  final tId = 1;
  final tUsuarioModelo = UsuarioModelo(id: tId, nome: 'alessandro');
  final UsuarioEntidade tUsuario = tUsuarioModelo;
  setUp(() {
    mockUsuarioApiFonteDados = MockUsuarioApiFonteDados();
    mockUsuarioLocalFonteDados = MockUsuarioLocalFonteDados();
    mockInformacaoRede = MockInformacaoRede();
    repository = UsuarioRepositorioImplementacao(
      apiFonteDados: mockUsuarioApiFonteDados,
      localFonteDados: mockUsuarioLocalFonteDados,
      informacaoRede: mockInformacaoRede,
    );
  });
}
