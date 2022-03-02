//instancia o serviço de localizacao de injeção
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/apresentacao/bloc/autenticacao_bloc.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dados/fontes_dados/api/autenticacao_api_fonte_dados.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dados/fontes_dados/local/autenticacao_local_fonte_dados.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dados/repositorios_dados/autenticacao_repositorio_dados.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/casos_uso/logar_autenticacao_caso_uso.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/dominio/repositorios/autenticacao_repositorio.dart';
import 'package:tdd_flutter/nucleo/plataforma/informacao_rede.dart';

final getIt = GetIt.instance;

Future<void> init() async {
//Funcionalidades
  getIt.registerFactory(
      () => AutenticacaoBloc(logarAutenticacaoCasoUso: getIt()));

  //Casos de Uso
  getIt.registerLazySingleton(() => LogarAutenticacaoCasoUso(getIt()));

  //Repositorio
  getIt.registerLazySingleton<AutenticacaoRepositorio>(() =>
      AutenticacaoRepositorioDados(
          apiFonteDados: getIt(),
          localFonteDados: getIt(),
          informacaoRede: getIt()));

//Fonte de Dados
  getIt.registerLazySingleton<AutenticacaoApiFonteDados>(
      () => AutenticacaoApiFonteDadosImplementacao(client: getIt()));
  getIt.registerLazySingleton<AutenticacaoLocalFonteDados>(() =>
      AutenticacaoLocalFonteDadosImplementacao(sharedPreferences: getIt()));

//Nucleo
  getIt.registerLazySingleton<InformacaoRede>(
      () => InformacaoRedeImplementado(getIt()));

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
