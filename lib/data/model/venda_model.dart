import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';
import 'package:projeto_estagio_vendas/core/constants/enum/tipo_produto.dart';
import 'produto_model.dart';

class VendaModel{
  ClienteModel? cliente;
  List<ProdutoModel>? produtos;
  double? precoTotal = 0;
  double? precoFinal = 0;
  double? desconto = 0;
  int? nroVenda;

  VendaModel({
    this.cliente,
    this.produtos,
  });

  void venda() async {
    bool todasAsCondicoes = true;
    int qtdlinguica = 0;
    int qtdlacteos = 0;
    int somarProdutoLinguica = 0;
    int somarProdutoLacteo = 0;
    double totalPreco = 0;

    for (ProdutoModel produto in produtos!.where((produto) => produto.qtd! > 0)) {
      precoTotal = produto.vlrPeso! * produto.qtd! * produto.pesoEmbalagem!;

      totalPreco += precoTotal!;

      if (produto.tipoProduto == TipoProduto.linguica.desc) {
        somarProdutoLinguica += produto.qtd!;

        if (somarProdutoLinguica == 3) {
          qtdlinguica = 3;
          break;
        }
        if (somarProdutoLinguica == 2) {
          qtdlinguica = 2;
        }
      }
      if (produto.tipoProduto == TipoProduto.lacteos.desc) {
        somarProdutoLacteo += produto.qtd!;
        if (somarProdutoLacteo == 2) {
          qtdlacteos = 2;
        }
      }
    }

    if (qtdlinguica == 3) {
      desconto = (totalPreco * 10) / 100;
    } else {
      precoFinal = totalPreco;
    }
    if (qtdlinguica == 2 && qtdlacteos == 2) {
      desconto = (totalPreco * 15) / 100;
    } else {
      precoFinal = totalPreco;
    }

    if (todasAsCondicoes) {
      precoFinal = totalPreco - desconto!;
      cliente!.descontarLimiteCredito(precoFinal!);
      listarVenda();
    }
  }

  String listarVenda() {
    String detalhesVenda = "";
    double totalPreco = 0.0;

    detalhesVenda += "Nome do Cliente: ${cliente!.nome}\nCNPJ do Cliente: ${cliente!.cnpj}\n";

    for (ProdutoModel produto in produtos!.where((produto) => produto.qtd! > 0)) {
      double totalProdutos = produto.vlrPeso! * produto.qtd! * produto.pesoEmbalagem!;
      totalPreco += totalProdutos;

      detalhesVenda += "\nProduto: ${produto.nome}\nValor do Produto por kg: R\$ ${produto.vlrPeso!.toStringAsFixed(2)}\nQuantidade Comprada: ${produto.qtd}\nTipo do Produto: ${produto.tipoProduto}\n";
    }
    if (desconto! > 0) {
      totalPreco -= desconto!;
      detalhesVenda += "\nDesconto: R\$ ${desconto!.toStringAsFixed(2)}";
    }
    if (precoFinal! > totalPreco) {
      detalhesVenda += "\nPreço Total: R\$ ${precoFinal!.toStringAsFixed(2)}";
    }
    detalhesVenda += "\nPreço Final: R\$ ${totalPreco.toStringAsFixed(2)}\n";
    return detalhesVenda;
  }
  @override
  String toString() {
    return 'Cliente: ${cliente!.nome}, Produtos: ${produtos}, Preço Total: ${precoTotal}, Preço Final: ${precoFinal}, Desconto: ${desconto}, NroVenda: ${nroVenda}';
  }
}
