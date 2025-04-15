import 'package:projeto_estagio_vendas/core/resources/base_model.dart';

class ProdutoVendaModel extends BaseModel{
  int? nroPedido;
  String? nomeProdutoVenda;
  int? codigoProdutoVenda;
  int? quantidadeProdutoVenda;

  ProdutoVendaModel({
    this.nomeProdutoVenda,
    this.codigoProdutoVenda,
    this.quantidadeProdutoVenda,
    this.nroPedido
  });

  ProdutoVendaModel.fromMap(Map<String, dynamic> json){
    nroPedido = json['numero_pedido'];
    nomeProdutoVenda = json['nome_produto_venda'];
    codigoProdutoVenda = json['codigo_produto_venda'];
    quantidadeProdutoVenda = json['quantidade_produto_venda'];
  }

  Map<String, dynamic> toMap(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['numero_pedido'] = nroPedido;
    data['nome_produto_venda'] = nomeProdutoVenda;
    data['codigo_produto_venda'] = codigoProdutoVenda;
    data['quantidade_produto_venda'] = quantidadeProdutoVenda;
    return data;
  }
  @override
  String toString() {
    return 'Nome Produto: $nomeProdutoVenda, Codigo: $codigoProdutoVenda, Quantidade: $quantidadeProdutoVenda, Numero Pedido: $nroPedido';
  }
}