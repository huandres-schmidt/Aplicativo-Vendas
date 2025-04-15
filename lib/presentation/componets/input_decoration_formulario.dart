import 'package:flutter/material.dart';
import 'package:projeto_estagio_vendas/core/constants/colors.dart';

/// Estilização Formularios de Cadastro Cliente

InputDecoration formularioCadastroCliente(String hint, Icon icon){
  return InputDecoration(
    icon: icon,
    iconColor: Colors.blue,
    hintText: hint,
    contentPadding: const EdgeInsets.fromLTRB(16, 20, 10, 10),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12)
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.green, width: 2),
    ),
  );
}

/// Estilização Formularios de Cadastro Produto

InputDecoration formularioCadastroProduto(String hint, Icon icon){
  return InputDecoration(
    icon: icon,
    iconColor: ColorsConstants.laranjaLogo,
    hintText: hint,
    contentPadding: const EdgeInsets.fromLTRB(16, 20, 10, 10),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12)
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.green, width: 2),
    ),
  );
}