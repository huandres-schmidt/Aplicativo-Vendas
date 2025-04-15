import 'package:flutter/material.dart';

void snackBarAddCliente(String texto, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${texto}', style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
    ),
  );
}