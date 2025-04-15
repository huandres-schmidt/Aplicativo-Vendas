import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/app.dart';
import 'injector.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final Injector injector = await _initializeApp();
  runApp(AuroraAppVendas(injector: injector));
}

Future<Injector> _initializeApp() async{
  final Injector injector = await InjectorImpl.inicializeDependencia();
  return injector;
}