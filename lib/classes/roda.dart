import 'dart:math';

//os 'late' diz que o codigo vai esperar ser atribuido um valor
//para a variavel
class Roda {
  late bool _calibragemPneu;

  Roda() {
    this._calibragemPneu = Random().nextBool();
  }

  void setCalibragem(bool calibragem) => _calibragemPneu = calibragem;

  bool getCalibragem() => _calibragemPneu;

  String toString() {
    return "roda: ${_calibragemPneu ? ' ' : ' não '}está calibrada";
  }
}
