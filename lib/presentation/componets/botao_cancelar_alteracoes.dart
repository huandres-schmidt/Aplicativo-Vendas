import 'package:flutter/material.dart';

class BotaoCancelarAlteracoes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.red),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
      onPressed: () => Navigator.pop(context),
      label: Text(
        'Cancelar',
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
      icon: Icon(
        Icons.close,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}