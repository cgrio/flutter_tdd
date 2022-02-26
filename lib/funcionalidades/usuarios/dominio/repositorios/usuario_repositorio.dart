import 'package:dartz/dartz.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dominio/entidades/usuario_entidade.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/falhas.dart';

abstract class UsuarioRepositorio {
  Future<Either<Falha, UsuarioEntidade>>? obterUsuarioCasoUso(int id);
}
