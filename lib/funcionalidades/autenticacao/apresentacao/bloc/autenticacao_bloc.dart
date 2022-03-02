import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dados/modelos/autenticacao_modelo.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/casos_uso/logar_autenticacao_caso_uso.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/entidades/autenticacao_entidade.dart';
import 'package:tdd_flutter/nucleo/tratamento_erros/falhas.dart';

part 'autenticacao_event.dart';
part 'autenticacao_state.dart';

class AutenticacaoBloc extends Bloc<AutenticacaoEvent, AutenticacaoState> {
  AutenticacaoBloc(
      {required LogarAutenticacaoCasoUso this.logarAutenticacaoCasoUso})
      : super(AutenticacaoInitial()) {
    on<AutenticacaoEvent>((event, emit) {
      on<LoginEvent>(_mapearEventoParaEstado);
    });
  }
  final LogarAutenticacaoCasoUso logarAutenticacaoCasoUso;
  AutenticacaoState get initialState => AutenticacaoInitial();

  void _mapearEventoParaEstado(
    LoginEvent event,
    Emitter<AutenticacaoState> emit,
  ) async {
    switch (event.runtimeType) {
      case LoginEvent:
        final AutenticacaoModelo autenticacao;
        final parametros =
            AutenticacaoParametros(login: event.login, senha: event.senha);
        final response = await logarAutenticacaoCasoUso(parametros);
        response?.fold((failure) {
          emit(ErroLoginState(mensagem: _mapearFalhaParaMensagem(failure)));
        }, (autenticacao) {
          emit(SucessoLoginState(autenticacao: autenticacao));
        });
    }
  }

  String _mapearFalhaParaMensagem(Falha failure) {
    switch (failure.runtimeType) {
      case ServidorFalha:
        return "Falha no servidor";
      case CacheFalha:
        return "Falha no cache da aplicação";
      default:
        return 'Unexpected error';
    }
  }
}

class AutenticacaoParametros {
  final String login;
  final String senha;

  AutenticacaoParametros({required this.login, required this.senha});
}
