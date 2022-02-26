import 'package:dartz/dartz.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dominio/entidades/usuario_entidade.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dominio/parametros/usuario_parametros.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dominio/repositorios/usuario_repositorio.dart';
import 'package:tdd_flutter/nucleo/casos_uso/caso_uso.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/falhas.dart';

class ObterUsuarioCasoUso extends CasoUso<UsuarioEntidade, UsuarioParametros> {
  final UsuarioRepositorio repositorio;
  ObterUsuarioCasoUso(this.repositorio);

  @override
  Future<Either<Falha, UsuarioEntidade>?> call(
      UsuarioParametros parametros) async {
    return await repositorio.obterUsuarioCasoUso(parametros.id);
  }
}
