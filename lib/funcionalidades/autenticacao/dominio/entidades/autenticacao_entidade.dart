import 'package:equatable/equatable.dart';

class AutenticacaoEntidade extends Equatable {
  final String? login;
  final String? senha;
  final String? appToken;
  final String? clienteToken;
  final String? appSenha;
  final String? clientSenha;
  final String? dataExpiracaoToken;
  AutenticacaoEntidade({
    this.login,
    this.senha,
    this.appToken,
    this.clienteToken,
    this.appSenha,
    this.clientSenha,
    this.dataExpiracaoToken,
  });

  @override
  List<Object?> get props {
    return [
      login,
      senha,
      appToken,
      clienteToken,
      appSenha,
      clientSenha,
      dataExpiracaoToken,
    ];
  }
}
