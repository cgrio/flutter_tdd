import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_flutter/nucleo/plataforma/informacao_rede.dart';

import 'informacao_rede_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker, InformacaoRede])
void main() {
  late InformacaoRedeImplementado informacaoRede;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    informacaoRede = InformacaoRedeImplementado(mockInternetConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to InternetConnectionChecker.hasConnection',
      () async {
        // arrange
        final tHasConnectionFuture = Future.value(true);

        when(mockInternetConnectionChecker.hasConnection)
            .thenAnswer((_) => tHasConnectionFuture);
        // act
        // NOTICE: We're NOT awaiting the result
        final result = informacaoRede.estaConectado;
        // assert
        verify(mockInternetConnectionChecker.hasConnection);
        // Utilizing Dart's default referential equality.
        // Only references to the same object are equal.
        expect(result, tHasConnectionFuture);
      },
    );
  });
}
