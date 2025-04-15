import 'venda_model.dart';
import 'cliente_model.dart';
import 'produto_model.dart';

class EmpresaModel{
  String? nome;
  String? cnpj;
  double? faturamento;
  List<ClienteModel>? cliente;
  List<ProdutoModel>? produtos;
  List<VendaModel>? vendas;

  EmpresaModel(
    this.nome,
    this.cnpj,
    this.cliente,
    this.produtos,
    this.vendas
  );

  double calculaFaturamento(double valorVenda){
    double valorFaturamento = 0;

    valorFaturamento += valorVenda;
    faturamento = valorFaturamento;
    return faturamento!;
  }

  @override
  String toString() {
    return 'Empresa{nome: $nome, cnpj: $cnpj, faturamento: $faturamento, cliente: $cliente, produtos: $produtos, vendas: $vendas}';
  }
}
