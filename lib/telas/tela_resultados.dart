import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../componentes/botao_inferior.dart';
import '../componentes/cartao_padrao.dart';
import '../componentes/constantes.dart';

class TelaResultados extends StatelessWidget {
  final String resultadoIMC;
  final String resultadoTexto;
  final String interpretacao;

  const TelaResultados({super.key, required this.resultadoIMC, required this.resultadoTexto, required this.interpretacao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Resultado',
                  style: kTituloTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: cartaoPadrao(
              cor: kCorAtivaCartaoPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultadoTexto.toUpperCase(),
                    style: kResultadoTextStyle,
                  ),
                  Text(
                    resultadoIMC,
                    style: kImcTextStyle,
                  ),
                  Text(
                    interpretacao,
                    style: kCorpoTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  BotaoInferior(
                    tituloBotao: 'RECALCULAR',
                    aoPressionar: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
