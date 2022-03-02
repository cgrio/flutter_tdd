import 'package:dartz/dartz.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/repositorios/autenticacao_repositorio.dart';
import 'package:tdd_flutter/nucleo/casos_uso/caso_uso.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/falhas.dart';

class SolicitarEnvioSenhaAutenticacaoCasoUso extends CasoUso<String, dynamic> {
  final AutenticacaoRepositorio repositorio;

  SolicitarEnvioSenhaAutenticacaoCasoUso(this.repositorio);

  @override
  Future<Either<Falha, String>?> call(parametros) async {
    return await repositorio.solicitarEnvioSenha(
        parametros.login, parametros.dataNascimento);
  }
}
