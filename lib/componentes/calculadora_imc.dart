import 'dart:math';

class CalculadoraImc {

  CalculadoraImc({this.altura, this.peso});  

  final int? altura;
  final int? peso;
  double? _imc;
  

  String calculdoraImc() {
    _imc = peso! / pow(altura! / 100, 2);
    return _imc!.toStringAsFixed(1);
  }

  String obterResultado() {
    if (_imc! >= 25) {
      return 'Acima do peso';
    } else if (_imc! > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do peso';
    }
  }

  String obterInterpretacao(){
    if(_imc! >= 25){
      return 'Você está com o peso acima do normal!';
    }else if(_imc! > 18.5){
      return 'Excelente! O seu peso está normal.';
    }else{
      return 'Você está com o peso abaixo do normal!';
    }
  }
}
