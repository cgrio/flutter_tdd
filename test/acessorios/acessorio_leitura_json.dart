import 'dart:io';

String acessoLeituraJson(String nome) =>
    File('test/acessorios/$nome').readAsStringSync();
