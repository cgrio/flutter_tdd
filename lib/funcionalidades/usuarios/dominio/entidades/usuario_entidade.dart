import 'package:equatable/equatable.dart';

class UsuarioEntidade extends Equatable {
  final int id;
  final String nome;

  const UsuarioEntidade({this.id = 0, this.nome = ""});

  @override
  List<Object?> get props => [id, nome];
}
