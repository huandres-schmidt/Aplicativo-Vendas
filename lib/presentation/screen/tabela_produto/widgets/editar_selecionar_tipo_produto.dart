import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/presentation/componets/input_decoration_formulario.dart';
import 'package:projeto_estagio_vendas/core/constants/enum/tipo_produto.dart';

class EditarSelecionarTipoProduto extends StatefulWidget {

  final Function(String? escolha) onTapDrop;
  final TipoProduto? tipoProdutos;

  const EditarSelecionarTipoProduto({super.key, required this.onTapDrop, required this.tipoProdutos});

  @override
  State<EditarSelecionarTipoProduto> createState() => _EditarSelecionarTipoProdutoState();
}

class _EditarSelecionarTipoProdutoState extends State<EditarSelecionarTipoProduto> {
  TipoProduto? selecionaTipo;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<TipoProduto>(
      decoration: formularioCadastroProduto(
        'Selecione o Tipo de Produto',
        Icon(
          Icons.category_outlined,
          size: 30,
        ),
      ),
      borderRadius: BorderRadius.circular(12),
      iconEnabledColor: Colors.orange,
      value: widget.tipoProdutos,
      onChanged: (tipoProdutoSelecionado) {

        selecionaTipo = widget.tipoProdutos;

        setState(() {
          selecionaTipo = tipoProdutoSelecionado;
        });
        widget.onTapDrop(tipoProdutoSelecionado!.desc);
      },
      items: TipoProduto.values.map((tipo) {
        return DropdownMenuItem(
          value: tipo,
          child: Text('${tipo.desc}'),
        );
      }).toList(),
    );
  }
}
