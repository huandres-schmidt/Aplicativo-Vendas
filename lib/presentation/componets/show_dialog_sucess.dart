import 'package:flutter/material.dart';

class ShowDialogSucess extends StatelessWidget {
  final String mensagem;

  ShowDialogSucess({required this.mensagem});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
        size: 35,
      ),
      backgroundColor: Colors.green,
      title: const Center(
        child: Text(
          'SUCESSO!',
          style: TextStyle(
              fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      content: Text(
        mensagem,
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Voltar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
