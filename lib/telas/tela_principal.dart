import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imc_app/telas/tela_resultados.dart';

import '../componentes/calculadora_imc.dart';
import 'package:flutter/material.dart';
import '../componentes/botao_arredondado.dart';
import '../componentes/botao_inferior.dart';
import '../componentes/cartao_icone.dart';
import '../componentes/cartao_padrao.dart';
import '../componentes/constantes.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';

enum Sexo {
  masculino,
  feminino,
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Sexo? sexoSelecionado;
  int altura = 180;
  int peso = 80;
  int idade = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calculadora IMC')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: cartaoPadrao(
                    aopressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.masculino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.masculino
                        ? kCorAtivaCartaoPadrao
                        : kCorInativaCartaoPadrao,
                    filhoCartao: cartaoIcone(
                      icone: FontAwesomeIcons.mars,
                      descricao: 'Masculino',
                    ),
                  ),
                ),
                Expanded(
                  child: cartaoPadrao(
                    aopressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.feminino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.feminino
                        ? kCorAtivaCartaoPadrao
                        : kCorInativaCartaoPadrao,
                    filhoCartao: cartaoIcone(
                      icone: FontAwesomeIcons.venus,
                      descricao: 'Feminino',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: cartaoPadrao(
              cor: kCorAtivaCartaoPadrao,
              filhoCartao: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Altura',
                      style: kDescricaoTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          altura.toString(),
                          style: kNumeroCartao,
                        ),
                        Text(
                          'cm',
                          style: kDescricaoTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Color(0xFFFF5822),
                      inactiveColor: Color(0xFF8D8e98),
                      onChanged: (double novoValor) {
                        setState(() {
                          altura = novoValor.round();
                        });
                      },
                      value: altura.toDouble(),
                      min: 120.0,
                      max: 220.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: cartaoPadrao(
                    cor: kCorAtivaCartaoPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PESO',
                          style: kDescricaoTextStyle,
                        ),
                        Text(
                          peso.toString(),
                          style: kNumeroCartao,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BotaoArredondado(
                              icone: FontAwesomeIcons.plus,
                              aoPressionar: () {
                                setState(() {
                                  peso++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            BotaoArredondado(
                              icone: FontAwesomeIcons.minus,
                              aoPressionar: () {
                                setState(() {
                                  peso--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: cartaoPadrao(
                    cor: kCorAtivaCartaoPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'IDADE',
                          style: kDescricaoTextStyle,
                        ),
                        Text(
                          idade.toString(),
                          style: kNumeroCartao,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          BotaoArredondado(
                            icone: FontAwesomeIcons.plus,
                            aoPressionar: () {
                              setState(() {
                                    idade++;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            BotaoArredondado(
                              icone: FontAwesomeIcons.minus,
                              aoPressionar: () {
                                setState(
                                  () {
                                    idade--;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BotaoInferior(
            tituloBotao: 'CALCULAR',
            aoPressionar: () {
              CalculadoraImc calc = CalculadoraImc(
                altura: altura,
                peso: peso,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaResultados(
                    resultadoIMC: calc.calculdoraImc(),
                    resultadoTexto: calc.obterResultado(),
                    interpretacao: calc.obterInterpretacao(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
