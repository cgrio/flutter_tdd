import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/apresentacao/bloc/autenticacao_bloc.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/apresentacao/pages/home_page.dart';
import 'package:tdd_flutter/funcionalidades/autenticacao/apresentacao/pages/login_page.dart';
import 'package:tdd_flutter/injection_container.dart';
import 'package:tdd_flutter/nucleo/simulador_api.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AutenticacaoBloc(logarAutenticacaoCasoUso: getIt()),
          ),
        ],
        child: BlocBuilder<AutenticacaoBloc, AutenticacaoState>(
          builder: (context, state) {
            if (state is SucessoLoginState) {
              return const HomePage();
            }
            if (state is ErroLoginState) {
              return LoginPage(mensagem: state.mensagem);
            }
            return const LoginPage();
          },
        ),
      ),
    );
  }
}
