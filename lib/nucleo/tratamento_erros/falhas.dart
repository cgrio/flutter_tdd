import 'package:equatable/equatable.dart';

abstract class Falha extends Equatable {
  const Falha([List properties = const <dynamic>[]]);
}

class ServidorFalha extends Falha {
  @override
  List<Object?> get props => [];
}

class CacheFalha extends Falha {
  @override
  List<Object?> get props => [];
}

class ErroFalha extends Falha {
  @override
  List<Object?> get props => [];
}
