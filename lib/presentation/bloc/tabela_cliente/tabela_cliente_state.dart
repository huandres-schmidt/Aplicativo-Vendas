import '../../../data/model/cliente_model.dart';

abstract class TabelaClienteState{
  List<ClienteModel> cliente;

  TabelaClienteState({
    required this.cliente
  });
}

class TabelaClienteInitialState extends TabelaClienteState{
  TabelaClienteInitialState() : super(cliente: []);
}

class TabelaClienteSucessState extends TabelaClienteState{
  TabelaClienteSucessState(List<ClienteModel> cliente) : super(cliente: cliente);
}

class TabelaClienteValidarSucessState extends TabelaClienteState{
  TabelaClienteValidarSucessState(List<ClienteModel> cliente) : super(cliente: cliente);
}

class TabelaClienteErrorState extends TabelaClienteState{
  final String error;

  TabelaClienteErrorState({required this.error}) : super(cliente: []);
}