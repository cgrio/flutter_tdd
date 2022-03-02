import 'package:dartz/dartz.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/entidades/autenticacao_entidade.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/falhas.dart';

abstract class AutenticacaoRepositorio {
  Future<Either<Falha, AutenticacaoEntidade>>? logar(
      String login, String senha);

  Future<Either<Falha, AutenticacaoEntidade>>? autenticarToken(
      String clienteToken,
      String clienteSenha,
      String? appToken,
      String? appSenha);

  Future<Either<Falha, String>>? solicitarEnvioSenha(
      String cpf, DateTime dataNascimento);

  Future<Either<Falha, void>>? deslogar();
}
