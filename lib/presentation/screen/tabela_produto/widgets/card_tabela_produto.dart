import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/core/constants/enum/tipo_produto.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/screen/tabela_produto/widgets/editar_produto.dart';
import 'package:projeto_estagio_vendas/presentation/screen/tabela_produto/widgets/deletar_produto.dart';
import '../../../../core/constants/colors.dart';
import '../../../../data/model/produto_model.dart';
import '../../../componets/detalhes_produto.dart';

class CardTabelaProduto extends StatefulWidget {

  final ProdutoModel produto;
  final TabelaProdutoBloc bloc;

  CardTabelaProduto({
    required this.produto,
    required this.bloc
  });

  @override
  State<CardTabelaProduto> createState() => _CardTabelaProdutoState();
}

class _CardTabelaProdutoState extends State<CardTabelaProduto> {

  @override
  Widget build(BuildContext context) {

    TextEditingController _controllerNomeProduto =
        TextEditingController(text: '${widget.produto.nome}');
    TextEditingController _controllerPeso =
        TextEditingController(text: '${widget.produto.pesoEmbalagem}');
    TextEditingController _controllerVlrPeso =
        TextEditingController(text: '${widget.produto.vlrPeso}');
    TextEditingController _controllerEstoque =
        TextEditingController(text: '${widget.produto.estoque}');
    TipoProduto? tipoProdutos;

    if(widget.produto.tipoProduto == TipoProduto.linguica.desc){
      tipoProdutos = TipoProduto.linguica;
    }
    if(widget.produto.tipoProduto == TipoProduto.frios.desc){
      tipoProdutos = TipoProduto.frios;
    }
    if(widget.produto.tipoProduto == TipoProduto.pizza.desc){
      tipoProdutos = TipoProduto.pizza;
    }
    if(widget.produto.tipoProduto == TipoProduto.lacteos.desc){
      tipoProdutos = TipoProduto.lacteos;
    }
    return Card(
      child: Material(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: ColorsConstants.laranjaPrincipal,
                child: ClipRRect(
                  child: IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          DetalhesProduto(produto: widget.produto),
                    ),
                    icon: Icon(
                      Icons.lunch_dining,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              title: Text(
                '${widget.produto.nome}',
              ),
              trailing: SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => EditarProduto(
                                tipoProdutoAtual: tipoProdutos,
                                bloc: widget.bloc,
                                controllerNome: _controllerNomeProduto,
                                controllerPeso: _controllerPeso,
                                controllerValorPeso: _controllerVlrPeso,
                                controllerEstoque: _controllerEstoque,
                                produto: widget.produto,
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              DeletarProduto(produto: widget.produto, bloc: widget.bloc),
                        );
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}