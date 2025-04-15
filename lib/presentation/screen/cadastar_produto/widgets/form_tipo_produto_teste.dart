import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_estagio_vendas/presentation/componets/input_decoration_formulario.dart';
import 'package:projeto_estagio_vendas/core/constants/enum/tipo_produto.dart';

import '../../../bloc/cadastrar_produto/cadastrar_produto_bloc.dart';
import '../../../bloc/cadastrar_produto/cadastrar_produto_state.dart';

class FormTipoProduto extends StatefulWidget {
  final Function(TipoProduto? escolha) onTapDrop;
  final Bloc bloc;

  const FormTipoProduto({
    super.key,
    required this.onTapDrop,
    required this.bloc,
  });

  @override
  State<FormTipoProduto> createState() => _FormTipoProdutoState();
}

class _FormTipoProdutoState extends State<FormTipoProduto> {
  TipoProduto? selecionaTipo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: BlocListener<CadastrarProdutoBloc, CadastrarProdutoState>(
        listener: (context, state) {
          if (state is ProdutoSucessoState) {
            setState(() {
              selecionaTipo = null;
            });
          }
        },
        child: DropdownButtonFormField<TipoProduto>(
          decoration: formularioCadastroProduto(
            'Selecione o Tipo de Produto',
            Icon(
              Icons.category_outlined,
              size: 30,
            ),
          ),
          borderRadius: BorderRadius.circular(12),
          iconEnabledColor: Colors.orange,
          value: selecionaTipo,
          onChanged: (tipoProdutoSelecionado) {
            setState(() {
              selecionaTipo = tipoProdutoSelecionado;
            });
            widget.onTapDrop(tipoProdutoSelecionado);
          },
          items: TipoProduto.values.map((tipo) {
            return DropdownMenuItem(
              value: tipo,
              child: Text('${tipo.desc}'),
            );
          }).toList(),
        ),
      ),
    );
  }
}
