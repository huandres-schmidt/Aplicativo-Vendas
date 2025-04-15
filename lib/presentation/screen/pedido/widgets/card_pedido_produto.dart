import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/data/model/produto_model.dart';
import 'package:projeto_estagio_vendas/presentation/componets/detalhes_produto.dart';
import 'package:projeto_estagio_vendas/presentation/screen/pedido/widgets/remover_quantidade_produto_pedido.dart';
import 'package:projeto_estagio_vendas/presentation/screen/pedido/widgets/valor_produto_unidade.dart';
import 'adicionar_quantidade_produto.dart';

class CardPedidoProduto extends StatefulWidget {
  final ProdutoModel produto;
  final Bloc bloc;
  final ValueNotifier<double> valorCompraNotifier;
  final List<ProdutoModel> pedido;

  CardPedidoProduto({
    required this.produto,
    required this.bloc,
    required this.valorCompraNotifier,
    required this.pedido,
  });

  @override
  State<CardPedidoProduto> createState() => _CardPedidoProdutoState();
}

class _CardPedidoProdutoState extends State<CardPedidoProduto> {
  @override
  Widget build(BuildContext context) {
    if (widget.produto.estoque! > 0) {
      return Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.orange,
            child: ClipRRect(
              child: IconButton(
                icon: Icon(Icons.lunch_dining),
                color: Colors.white,
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      DetalhesProduto(produto: widget.produto),
                ),
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${widget.produto.nome}',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          subtitle: ValorProdutoUnidade(
            pesoEmbalagem: widget.produto.pesoEmbalagem!,
            valorPeso: widget.produto.vlrPeso!,
          ),
          trailing: SizedBox(
            width: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      removerQuantidadeProduto(
                          valorCompraNotifier: widget.valorCompraNotifier,
                          pedido: widget.pedido,
                          context: context,
                          produtos: widget.produto);
                      widget.valorCompraNotifier.value;
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '${widget.produto.qtd}',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      AdicionarQuantidadeProduto(
                          valorCompraNotifier: widget.valorCompraNotifier,
                          produtos: widget.produto,
                          context: context,
                          pedido: widget.pedido,
                      );
                      widget.valorCompraNotifier.value;
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red,
            child: ClipRRect(
              child: IconButton(
                icon: Icon(Icons.lunch_dining_outlined),
                color: Colors.white,
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      DetalhesProduto(produto: widget.produto),
                ),
              ),
            ),
          ),
          title: Text(
            '${widget.produto.nome}',
            style: TextStyle(
                fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          trailing: SizedBox(
            width: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.green,
                    size: 27,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
