import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../componets/input_decoration_formulario.dart';

class FormCodigoProduto extends StatefulWidget {
  final TextEditingController controller;

  FormCodigoProduto({required this.controller});

  @override
  State<StatefulWidget> createState() => _FormCodigoProduto();
}

class _FormCodigoProduto extends State<FormCodigoProduto> {
  @override
  Widget build(BuildContext context) {
    var cdProduto = MaskTextInputFormatter(mask: '###');
    return TextFormField(
      inputFormatters: [cdProduto],
      controller: widget.controller,
      decoration: formularioCadastroProduto(
        'Código do Produto',
        Icon(Icons.numbers, size: 30
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
