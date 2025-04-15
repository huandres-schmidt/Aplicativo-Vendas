import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';

abstract class SelecionarClienteState {
  List<ClienteModel> clienteModel;

  SelecionarClienteState({required this.clienteModel});
}

class SelecionarClienteInitialState extends SelecionarClienteState {
  SelecionarClienteInitialState() : super(clienteModel: []);
}

class SelecionarClienteSucessState extends SelecionarClienteState {

  SelecionarClienteSucessState(List<ClienteModel> clienteModel)
      : super(clienteModel: clienteModel);
}

class SelecionarClienteErrorState extends SelecionarClienteState{
  final String erro;

  SelecionarClienteErrorState({required this.erro})
      : super(
      clienteModel: []);
}
