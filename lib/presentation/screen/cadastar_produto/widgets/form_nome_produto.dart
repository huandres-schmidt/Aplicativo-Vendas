import 'package:flutter/material.dart';
import '../../../componets/input_decoration_formulario.dart';

class FormNomeProduto extends StatefulWidget {
  final TextEditingController controller;

  FormNomeProduto({required this.controller});

  @override
  State<StatefulWidget> createState() => _FormNomeProduto();
}

class _FormNomeProduto extends State<FormNomeProduto> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: formularioCadastroProduto(
        'Nome do Produto',
        Icon(Icons.fastfood, size: 30
        ),
      ),
    );
  }
}
