import '../../../data/model/cliente_model.dart';

abstract class CadastrarClienteState {
  List<ClienteModel> cliente;

  CadastrarClienteState({
    required this.cliente
  });
}

class ClienteInitialState extends CadastrarClienteState{
  ClienteInitialState() : super(cliente: []);
}

class ClienteSucessState extends CadastrarClienteState{
  ClienteSucessState() : super(cliente: []);
}

class ClienteErrorState extends CadastrarClienteState{
  final String erro;

  ClienteErrorState({required this.erro}) : super(cliente: []);
}





