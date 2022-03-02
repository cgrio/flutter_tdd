part of 'autenticacao_bloc.dart';

abstract class AutenticacaoState extends Equatable {
  const AutenticacaoState();

  @override
  List<Object> get props => [];
}

class AutenticacaoInitial extends AutenticacaoState {}

class IniciarLoginState extends AutenticacaoState {}

class SucessoLoginState extends AutenticacaoState {
  final AutenticacaoEntidade autenticacao;
  SucessoLoginState({
    required this.autenticacao,
  });
  @override
  List<Object> get props => [autenticacao];
}

class ErroLoginState extends AutenticacaoState {
  final String mensagem;
  ErroLoginState({
    required this.mensagem,
  });
  @override
  List<Object> get props => [mensagem];
}
