import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:tdd_flutter/funcionalidades/usuarios/dados/fontes_dados/api/usuario_api_fonte_dados.dart';
import 'usuario_api_fonte_dados_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  UsuarioApiFonteDadosImplementacao fonteDados;
  MockClient mockHttpCliente;
}
