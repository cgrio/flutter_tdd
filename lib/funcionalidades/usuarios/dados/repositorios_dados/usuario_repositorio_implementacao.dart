import 'package:dartz/dartz.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dados/fontes_dados/api/usuario_api_fonte_dados.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dados/fontes_dados/local/usuario_local_fonte_dados.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dominio/entidades/usuario_entidade.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dominio/repositorios/usuario_repositorio.dart';
import 'package:tdd_flutter/nucleo/plataforma/informacao_rede.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/excecoes.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/falhas.dart';

class UsuarioRepositorioImplementacao implements UsuarioRepositorio {
  final UsuarioApiFonteDados apiFonteDados;
  final UsuarioLocalFonteDados localFonteDados;
  final InformacaoRede informacaoRede;

  UsuarioRepositorioImplementacao(
      {required this.apiFonteDados,
      required this.localFonteDados,
      required this.informacaoRede});

  @override
  Future<Either<Falha, UsuarioEntidade>> obterUsuarioCasoUso(
    int id,
  ) async {
    if (await informacaoRede.estaConectado) {
      try {
        final resultadoApiUsario = await apiFonteDados.obterUsuarioCasoUso(id);
        localFonteDados.cacheUsuario(resultadoApiUsario!);
        return Right(resultadoApiUsario);
      } on ServidorExcecao {
        return Left(ServidorFalha());
      }
    } else {
      try {
        final resultadoLocalUsuario =
            await localFonteDados.obterUltimoUsuario();
        return Right(resultadoLocalUsuario);
      } on CacheExcecao {
        return Left(CacheFalha());
      }
    }
  }
}
