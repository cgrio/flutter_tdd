import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/falhas.dart';

abstract class CasoUso<Type, Params> {
  Future<Either<Falha, Type>?> call(Params parametros);
}

class SemParametros extends Equatable {
  @override
  List<Object?> get props => [];
}
