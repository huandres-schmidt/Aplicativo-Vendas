
import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';

abstract class TabelaClienteEvent{}

class TabelaClienteLoadEvent extends TabelaClienteEvent{}

class TabelaClienteRemoveEvent extends TabelaClienteEvent{
  ClienteModel cliente;

  TabelaClienteRemoveEvent({
   required this.cliente
  });
}

class TabelaClienteEditEvent extends TabelaClienteEvent{
  ClienteModel cliente;

  TabelaClienteEditEvent({
    required this.cliente
  });
}

class TabelaClienteValidarEditEvent extends TabelaClienteEvent{
  String? cnpj;
  String? nome;
  double? limiteCredito;

  TabelaClienteValidarEditEvent({
    required this.nome,
    required this.cnpj,
    required this.limiteCredito
  });
}


