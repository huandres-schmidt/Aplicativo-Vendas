import 'package:flutter/material.dart';

void snackBarRemoveCliente(String texto, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${texto}', style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
    ),
  );
}