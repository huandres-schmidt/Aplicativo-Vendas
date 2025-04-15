import 'package:projeto_estagio_vendas/data/model/empresa_data_base_model.dart';
import 'package:projeto_estagio_vendas/data/model/venda_database_model.dart';
import '../../../data/model/cliente_model.dart';
import '../../../data/model/produto_model.dart';

abstract class PedidoEvent{}

class PedidoLoadEvent extends PedidoEvent{}

class PedidoValidarEvent extends PedidoEvent{
  ClienteModel clienteModel;
  double? valorCompra;

  PedidoValidarEvent({
    required this.clienteModel,
    required this.valorCompra,
  });
}

class PedidoAddEvent extends PedidoEvent{
  VendaDatabaseModel vendaDataBase;
  List<ProdutoModel> produtos;
  ClienteModel clienteModel;

  PedidoAddEvent({
    required this.vendaDataBase,
    required this.produtos,
    required this.clienteModel,
  });
}

class PedidoDescontoCreditoClientEvent extends PedidoEvent{
  ClienteModel clienteModel;

  PedidoDescontoCreditoClientEvent({
    required this.clienteModel
  });
}

class PedidoDescontoEstoqueProdutoEvent extends PedidoEvent{
  ProdutoModel produto;

  PedidoDescontoEstoqueProdutoEvent({
    required this.produto
  });
}

class PedidoAddFaturamentoEvent extends PedidoEvent{
  EmpresaDatabaseModel empresaDataBase;

  PedidoAddFaturamentoEvent({
   required this.empresaDataBase
  });
}



