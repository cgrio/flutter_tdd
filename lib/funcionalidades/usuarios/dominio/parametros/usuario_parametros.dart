import 'package:equatable/equatable.dart';

class UsuarioParametros extends Equatable {
  final int id;

  const UsuarioParametros({required this.id});

  @override
  List<Object> get props => [id];
}
