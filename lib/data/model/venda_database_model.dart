import 'package:projeto_estagio_vendas/core/resources/base_model.dart';

class VendaDatabaseModel extends BaseModel{
  int? nroVenda;
  double? precoTotal;
  double? precoFinal;
  double? descontoVenda;
  String? clienteCnpj;
  String? clienteNome;

  VendaDatabaseModel({
      this.nroVenda,
      this.precoTotal,
      this.precoFinal,
      this.descontoVenda,
      this.clienteCnpj,
      this.clienteNome,
  });

  VendaDatabaseModel.fromMap(Map<String, dynamic> json) {
    nroVenda = json['numero_venda'];
    precoTotal = json['preco_total'];
    precoFinal = json['preco_final'];
    descontoVenda = json['desconto_venda'];
    clienteCnpj = json['cliente_cnpj_venda'];
    clienteNome = json['cliente_nome_venda'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['numero_venda'] = nroVenda;
    data['preco_total'] = precoTotal;
    data['preco_final'] = precoFinal;
    data['desconto_venda'] = descontoVenda;
    data['cliente_cnpj_venda'] = clienteCnpj;
    data['cliente_nome_venda'] = clienteNome;
    return data;
  }

  @override
  String toString() {
    return 'Preço Total: $precoTotal, Preço Final: $precoFinal, Desconto: $descontoVenda, Cliente CNPJ: $clienteCnpj, Cliente Nome: $clienteNome';
  }
}
