import 'package:flutter/material.dart';

class NenhumClienteCadastrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.person_search,
            size: 70,
          ),
          Text(
            'NENHUM CLIENTE CADASTRADO!',
          )
        ],
      ),
    );
  }
}
