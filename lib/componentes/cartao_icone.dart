import 'package:flutter/material.dart';

import 'constantes.dart';





class cartaoIcone extends StatelessWidget {
  cartaoIcone({ this.icone,  this.descricao});
  final IconData? icone;
  final String? descricao;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icone,
          size: 40.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          descricao!,
          style: kDescricaoTextStyle,
        ),
      ],
    );
  }
}

