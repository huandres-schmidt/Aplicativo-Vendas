import 'package:flutter/material.dart';

class NenhumaVendaCadastrada extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.shopping_bag_rounded,
            size: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NENHUMA VENDA ENCONTRADA!',
              ),
            ],
          )
        ],
      ),
    );
  }
}