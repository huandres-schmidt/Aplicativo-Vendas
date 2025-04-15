import 'package:flutter/material.dart';

class NenhumProdutoCadastrado extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.no_food,
            size: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NENHUM PRODUTO CADASTRADO!',
              ),
            ],
          )
        ],
      ),
    );
  }
}