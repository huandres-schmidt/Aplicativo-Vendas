import 'package:flutter/material.dart';
import '../../../componets/input_decoration_formulario.dart';

class FormValorPesoProduto extends StatefulWidget {
  final TextEditingController controller;

  FormValorPesoProduto({required this.controller});

  @override
  State<StatefulWidget> createState() => _FormValorPesoProduto();
}

class _FormValorPesoProduto extends State<FormValorPesoProduto> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: formularioCadastroProduto(
        'Valor por Kg ou Ml',
        Icon(Icons.attach_money, size: 30
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
