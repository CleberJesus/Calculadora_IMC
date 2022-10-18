import 'package:flutter/material.dart';
import 'package:imc_app/telas/tela_principal.dart';



void main() {
  runApp(const CalculadoraImcapp());
}

class CalculadoraImcapp extends StatelessWidget {
  const CalculadoraImcapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const TelaPrincipal(),
    );
  }
}

