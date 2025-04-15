import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_error.dart';
import 'package:projeto_estagio_vendas/presentation/componets/show_dialog_sucess.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/cadastrar_cliente/cadastrar_cliente_state.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_cliente/widgets/botao_cadastrar_cliente.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_cliente/widgets/form_limite_credito_cliente.dart';
import 'package:projeto_estagio_vendas/presentation/screen/cadastar_cliente/widgets/form_nome_cliente.dart';
import '../../bloc/cadastrar_cliente/cadastrar_cliente_bloc.dart';
import 'widgets/form_cnpj_cliente.dart';

class CadastrarClienteScreen extends StatefulWidget {
  const CadastrarClienteScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CadastrarClienteScreenState();
}

class _CadastrarClienteScreenState extends State<CadastrarClienteScreen> {
  TextEditingController controllerNomeCliente = TextEditingController();
  TextEditingController controllerCnpjCliente = TextEditingController();
  TextEditingController controllerLimiteCredito = TextEditingController();
  final bloc = GetIt.I.get<CadastrarClienteBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          title: const Text(
            'CADASTRAR CLIENTE',
          ),
        ),
        body: BlocListener<CadastrarClienteBloc, CadastrarClienteState>(
          listener: (context, state) {
            if (state is ClienteErrorState) {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    ShowDialogError(mensagem: state.erro),
              );
            }
            if (state is ClienteSucessState) {
              showDialog(
                context: context,
                builder: (BuildContext context) => ShowDialogSucess(
                    mensagem: 'Cliente Cadastrado com Sucesso!'),
              );
              controllerNomeCliente.text = "";
              controllerCnpjCliente.text = "";
              controllerLimiteCredito.text = "";
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    'assets/images/icone_tela_home.jpg',
                    color: Colors.white,
                    width: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        FormNomeCliente(controller: controllerNomeCliente),
                        const SizedBox(height: 15),
                        FormCnpjCliente(controller: controllerCnpjCliente),
                        const SizedBox(height: 15),
                        FormLimiteCredito(controller: controllerLimiteCredito),
                        const SizedBox(height: 30),
                        BotaoCadastrarCliente(
                          controllerCnpj: controllerCnpjCliente,
                          controllerCredito: controllerLimiteCredito,
                          controllerNome: controllerNomeCliente,
                          bloc: bloc,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
