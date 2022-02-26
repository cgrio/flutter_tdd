import 'package:tdd_flutter/funcionalidades/usuarios/dominio/entidades/usuario_entidade.dart';

class UsuarioModelo extends UsuarioEntidade {
  const UsuarioModelo({required int id, required String nome})
      : super(id: id, nome: nome);

  factory UsuarioModelo.fromJson(Map<String, dynamic> json) {
    return UsuarioModelo(id: json['id'], nome: json['nome']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nome': nome};
  }
}
