import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';

abstract class CadastrarClienteEvent {}

class ClienteValidarEvent extends CadastrarClienteEvent{
  final String? nome;
  final String? cnpj;
  final double? limiteCredito;

  ClienteValidarEvent(this.nome, this.cnpj, this.limiteCredito);
}

class ClienteAddEvent extends CadastrarClienteEvent{
  ClienteModel cliente;

  ClienteAddEvent({
    required this.cliente,
  });
}








