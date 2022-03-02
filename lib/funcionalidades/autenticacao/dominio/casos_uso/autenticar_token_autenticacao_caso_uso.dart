import 'package:dartz/dartz.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/entidades/autenticacao_entidade.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/repositorios/autenticacao_repositorio.dart';
import 'package:tdd_flutter/nucleo/casos_uso/caso_uso.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/falhas.dart';

class AutenticarTokenAutenticacaoCasoUso
    extends CasoUso<AutenticacaoEntidade, dynamic> {
  final AutenticacaoRepositorio repositorio;

  AutenticarTokenAutenticacaoCasoUso(this.repositorio);

  @override
  Future<Either<Falha, AutenticacaoEntidade>?> call(parametros) async {
    return await repositorio.autenticarToken(parametros.clienteToken,
        parametros.clienteSenha, parametros.appToken, parametros.appSenha);
  }
}
