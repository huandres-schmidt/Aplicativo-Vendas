import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_estagio_vendas/data/model/empresa_data_base_model.dart';
import 'package:projeto_estagio_vendas/presentation/screen/empresa_home/widgets/cadastrar_cliente.dart';
import 'package:projeto_estagio_vendas/presentation/screen/empresa_home/widgets/cadastrar_produto.dart';
import 'package:projeto_estagio_vendas/presentation/screen/empresa_home/widgets/clientes_aurora.dart';
import 'package:projeto_estagio_vendas/presentation/screen/empresa_home/widgets/faturamento_empresa_vazio.dart';
import 'package:projeto_estagio_vendas/presentation/screen/empresa_home/widgets/listar_venda.dart';
import 'package:projeto_estagio_vendas/presentation/screen/empresa_home/widgets/produtos_aurora.dart';
import 'package:projeto_estagio_vendas/presentation/screen/empresa_home/widgets/realizar_venda.dart';
import '../../../data/model/empresa_model.dart';
import '../../bloc/empresa/empresa_bloc.dart';
import '../../bloc/empresa/empresa_events.dart';
import '../../bloc/empresa/empresa_state.dart';
import 'widgets/faturamento_empresa.dart';

class EmpresaHomeScreen extends StatefulWidget {
  static EmpresaModel empresa = EmpresaModel('Aurora Coop', '83.310.441/0001-17', [], [], []);

  const EmpresaHomeScreen({super.key});

  @override
  State<EmpresaHomeScreen> createState() => _EmpresaHomeScreenState();
}

class _EmpresaHomeScreenState extends State<EmpresaHomeScreen> {
  final bloc = GetIt.I.get<EmpresaBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(EmpresaLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<EmpresaBloc, EmpresaState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is EmpresaInitialState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              }
              if (state is EmpresaSucessState) {
                final empresa = state.empresa;
                if (empresa == null) {
                  bloc.add(
                    EmpresaAddEvent(
                      empresaDataBase: EmpresaDatabaseModel(
                        nomeEmpresa: EmpresaHomeScreen.empresa.nome,
                        faturamentoEmpresa: 0,
                        cnpjEmpresa: EmpresaHomeScreen.empresa.cnpj,
                      ),
                    ),
                  );
                  return FaturamentoEmpresaVazio();
                } else {
                  return FaturamentoEmpresa(empresa: empresa);
                }
              } else {
                return Center(
                  child: const Text(
                    'Ocorreu um Erro Inesperado',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
            },
          ),
          SizedBox(height: 20),
          CadastrarCliente(),
          CadastrarProduto(),
          RealizarVenda(),
          ListaVenda(),
          ClientesAurora(),
          ProdutoAurora(),
        ],
      ),
    );
  }
}
