import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../componets/input_decoration_formulario.dart';

class FormCnpjCliente extends StatefulWidget{

  final TextEditingController controller;
  FormCnpjCliente({required this.controller});

  @override
  State<StatefulWidget> createState() => _FormCnpjCliente();
}

class _FormCnpjCliente extends State<FormCnpjCliente>{

  @override
  Widget build(BuildContext context) {
    var cnpj = MaskTextInputFormatter(mask: '##.###.###/####-##');
    return TextFormField(
      inputFormatters: [cnpj],
      controller: widget.controller,
      keyboardType: TextInputType.number,
      decoration: formularioCadastroCliente(
        'CNPJ do Cliente',
        Icon(Icons.business_center_sharp, size: 30
        ),
      ),
    );
  }
}