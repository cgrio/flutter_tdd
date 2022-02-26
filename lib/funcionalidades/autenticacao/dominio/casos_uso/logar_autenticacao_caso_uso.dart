import 'package:dartz/dartz.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/entidades/autenticacao_entidade.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/repositorios/autenticacao_repositorio.dart';
import 'package:tdd_flutter/nucleo/casos_uso/caso_uso.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/falhas.dart';

class LogarAutenticacaoCasoUso extends CasoUso<AutenticacaoEntidade, dynamic> {
  final AutenticaoRepositorio repositorio;

  LogarAutenticacaoCasoUso(this.repositorio);

  @override
  Future<Either<Falha, AutenticacaoEntidade>?> call(parametros) async {
    return await repositorio.logar(parametros.login, parametros.senha);
  }
}
