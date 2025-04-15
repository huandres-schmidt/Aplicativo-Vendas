import 'package:projeto_estagio_vendas/core/resources/base_model.dart';

class ProdutoModel extends BaseModel{
  String? nome;
  int? cdProduto;
  double? pesoEmbalagem;
  double? vlrPeso;
  int? estoque;
  int? qtd = 0;
  String? tipoProduto;

  ProdutoModel({
      this.nome,
      this.cdProduto,
      this.pesoEmbalagem,
      this.vlrPeso,
      this.estoque,
      this.qtd = 0,
      this.tipoProduto,
  });

  Map<String, dynamic> toMap(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome_produto'] = nome;
    data['codigo_produto'] = cdProduto;
    data['peso_embalagem_produto'] = pesoEmbalagem;
    data['valor_peso_produto'] = vlrPeso;
    data['estoque_produto'] = estoque;
    data['tipo_produto'] = tipoProduto;
    return data;
  }

  ProdutoModel.fromMap(Map<String,dynamic> json){
    nome = json['nome_produto'];
    cdProduto = json['codigo_produto'];
    pesoEmbalagem = json['peso_embalagem_produto'];
    vlrPeso = json['valor_peso_produto'];
    estoque = json['estoque_produto'];
    tipoProduto = json['tipo_produto'];
  }

  Future<void> descontaEstoque() async {
    estoque = estoque! - qtd!;
  }

  double calculaPrecoTotal() {
    return qtd! * pesoEmbalagem! * vlrPeso!;
  }

  @override
  String toString() {
    return 'Produto{nome: $nome, cdProduto: $cdProduto, pesoEmbalagem: $pesoEmbalagem, vlrPeso: $vlrPeso, estoque: $estoque, qtd: $qtd, tipo produto: $tipoProduto';
  }
}
