import 'package:flutter/Material.dart';

import 'constantes.dart';



class BotaoInferior extends StatelessWidget {
  BotaoInferior({required this.aoPressionar, required this.tituloBotao});  

  final Function()? aoPressionar;
  final String tituloBotao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.topCenter,
          child: Text(
            tituloBotao,
            style: kBotaoGrandetextStyle,
            textAlign: TextAlign.center,
            
          ),
          color: Colors.orange,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: kAlturaContainerInferior,
        ),
      ),
    );
  }
}
