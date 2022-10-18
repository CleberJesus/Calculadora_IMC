import 'package:flutter/material.dart';

class cartaoPadrao extends StatelessWidget {
  //cartaoPadrao({ this.cor, this.filhoCartao});

  final Color? cor;
  final Widget? filhoCartao;
  final Function()? aopressionar;

  // ignore: use_key_in_widget_constructors
  const cartaoPadrao({ this.cor, this.filhoCartao, this.aopressionar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aopressionar,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: filhoCartao,
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
