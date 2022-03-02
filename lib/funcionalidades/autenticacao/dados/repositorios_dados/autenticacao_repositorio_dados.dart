import 'package:dartz/dartz.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dados/fontes_dados/api/autenticacao_api_fonte_dados.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dados/fontes_dados/local/autenticacao_local_fonte_dados.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/entidades/autenticacao_entidade.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/repositorios/autenticacao_repositorio.dart';
import 'package:tdd_flutter/nucleo/plataforma/informacao_rede.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/excecoes.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/falhas.dart';

class AutenticacaoRepositorioDados implements AutenticacaoRepositorio {
  final AutenticacaoApiFonteDados apiFonteDados;
  final AutenticacaoLocalFonteDados localFonteDados;
  final InformacaoRede informacaoRede;

  AutenticacaoRepositorioDados(
      {required this.apiFonteDados,
      required this.localFonteDados,
      required this.informacaoRede});

  @override
  Future<Either<Falha, AutenticacaoEntidade>>? autenticarToken(
      String clienteToken,
      String clienteSenha,
      String? appToken,
      String? appSenha) async {
    try {
      //busco usuario do cache
      final autenticacaoModelo =
          await localFonteDados.acaoObterAutenticacaoCache();
      if (autenticacaoModelo != null) {
        // se a data de validade é maior que hoje devolvo o usuário do cache

        // if(DateTime.now().isBefore(DateTime.tryParse(
        //         autenticacaoModelo.dataExpiracaoToken.toString()) )){}
        return Right(autenticacaoModelo);
      } else {
        final autenticacaoModeloApi = await apiFonteDados.acaoLogarAutenticacao(
            clienteToken, clienteSenha);

        if (autenticacaoModeloApi != null) {
          return Right(autenticacaoModeloApi);
        }
      }
      return Left(ErroFalha());
    } on CacheExcecao {
      return Left(CacheFalha());
    }

    //se existe rede

    //faço a reautenticacao do token
  }

  @override
  Future<Either<Falha, AutenticacaoEntidade>>? logar(
      String pLogin, String pSenha) async {
    try {
      if (await informacaoRede.estaConectado) {
        final autenticacaoModeloApi =
            await apiFonteDados.acaoLogarAutenticacao(pLogin, pSenha);
        if (autenticacaoModeloApi != null) {
          localFonteDados.acaoGuardarAutenticacaoCache(autenticacaoModeloApi);
          return Right(autenticacaoModeloApi);
        }
        return Left(ErroFalha());
      } else {
        return Left(ErroFalha());
      }
    } on CacheExcecao {
      return Left(CacheFalha());
    }
  }

  @override
  Future<Either<Falha, String>>? solicitarEnvioSenha(
      String cpf, DateTime dataNascimento) async {
    try {
      if (await informacaoRede.estaConectado) {
        apiFonteDados.acaoSolicitarEnvioSenhaAutenticacao(cpf, dataNascimento);
        return const Right("Solicitacao Enviada");
      } else {
        return const Right("Verifique sua conexão e tente novamente.");
      }
    } on CacheExcecao {
      return Left(CacheFalha());
    }
  }

  @override
  Future<Either<Falha, void>>? deslogar() async {
    try {
      await localFonteDados.acaoApagarAutenticacaoCache();
      return const Right(null);
    } on CacheExcecao {
      return Left(CacheFalha());
    }
  }
}
