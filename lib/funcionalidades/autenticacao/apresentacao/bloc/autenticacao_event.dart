part of 'autenticacao_bloc.dart';

abstract class AutenticacaoEvent extends Equatable {
  const AutenticacaoEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AutenticacaoEvent {
  final String login;
  final String senha;
  const LoginEvent({
    required this.login,
    required this.senha,
  });

  @override
  List<Object> get props => [login, senha];
}
