import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/config/theme.dart';
import 'package:projeto_estagio_vendas/injector.dart';
import 'package:projeto_estagio_vendas/presentation/screen/empresa_home/empresa_home_screen.dart';
import 'config/routes.dart';

class AuroraAppVendas extends StatefulWidget{
  AuroraAppVendas({required this.injector});

  final Injector injector;

  @override
  State<AuroraAppVendas> createState() => _AuroraAppVendasState();
}

class _AuroraAppVendasState extends State<AuroraAppVendas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aurora Coop Vendas',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routes: Routes.routes,
      home: const EmpresaHomeScreen(),
    );
  }
}