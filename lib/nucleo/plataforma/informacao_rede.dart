import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InformacaoRede {
  Future<bool> get estaConectado;
}

class InformacaoRedeImplementado implements InformacaoRede {
  final InternetConnectionChecker connectionChecker;

  InformacaoRedeImplementado(this.connectionChecker);

  @override
  Future<bool> get estaConectado => connectionChecker.hasConnection;
}
