import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dados/fontes_dados/api/autenticacao_api_fonte_dados.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dados/modelos/autenticacao_modelo.dart';
import '../../../../acessorios/acessorio_leitura_json.dart';
import 'autenticacao_api_fonte_dados_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  AutenticacaoApiFonteDadosImplementacao? fonteDados;
  MockClient? mockHttpCliente;

  setUp(() {
    mockHttpCliente = MockClient();
    fonteDados = AutenticacaoApiFonteDadosImplementacao(
        client: mockHttpCliente as http.Client);
  });

  void seUpMockHttpClientSucesso200() {
    when(mockHttpCliente?.post(any,
            headers: anyNamed('headers'), body: anything))
        .thenAnswer((_) async =>
            http.Response(acessoLeituraJson("login_unisuam.json"), 200));
  }

  void seUpMockHttpClientFalha404() {
    when(mockHttpCliente?.post(any,
            headers: anyNamed('headers'), body: anything))
        .thenAnswer((_) async => http.Response("Algo deu errado", 404));
  }

  group('Login Api', () {
    final tLogin = '21103093';
    final tSenha = '66156523';
    final tAutenticacaoModelo = AutenticacaoModelo.fromJson(
        json.decode(acessoLeituraJson('login_unisuam.json')));

    test(
        "Deve fazer a autenticacao na api e obter minhas credenciais de acesso",
        () async {
      seUpMockHttpClientSucesso200();
      fonteDados?.acaoLogarAutenticacao(tLogin, tSenha);
      verifyNever(mockHttpCliente!
          .post(Uri.parse('http://apimobile.unisuam.edu.br/login'), headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'authentication-key-fixed': 'cf66d3212ae4176f3909d0be33525c70'
      }, body: {
        'username': tLogin,
        'password': tSenha,
      }));
    });

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        seUpMockHttpClientSucesso200();
        // act
        final result = await fonteDados?.acaoLogarAutenticacao(tLogin, tSenha);
        // assert
        expect(result, equals(tAutenticacaoModelo));
      },
    );
  });
}
