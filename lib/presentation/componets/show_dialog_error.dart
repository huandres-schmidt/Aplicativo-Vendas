import 'package:flutter/material.dart';

class ShowDialogError extends StatelessWidget {
  final String mensagem;

  ShowDialogError({required this.mensagem});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.error_sharp,
        color: Colors.white,
        size: 35,
      ),
      backgroundColor: Colors.red,
      title: const Center(
        child: Text(
          'ATENÇÃO',
          style: TextStyle(
              fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      content: Text(
        mensagem,
        style: const TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Voltar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}