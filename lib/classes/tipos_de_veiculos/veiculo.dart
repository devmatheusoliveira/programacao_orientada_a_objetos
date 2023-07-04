// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../ipva.dart';
import '../roda.dart';

abstract class Veiculo {
  int _id;
  List<Roda> _rodas = [];
  late int _quantidadeDeRodas;
  int _distanciaPercorrida = 0;

  // no flutter não precisa de abstract antes de funcoes
  // apenas declarar sem corpo
  int getQuantidadeDeRodas();
  String desenhar();
  String toString();

  void mover();

  Veiculo(this._id) {
    _quantidadeDeRodas = getQuantidadeDeRodas();

    setEstadoDasRodas();
  }

  int getId() => this._id;

  List<Roda> getRodas() => _rodas;

  void setEstadoDasRodas() {
    for (int indexRoda = 0; indexRoda < this._quantidadeDeRodas; indexRoda++) {
      Roda roda = Roda();
      _rodas.add(roda);
    }
  }

  int getDistanciaPercorrida() => _distanciaPercorrida;
  void setDistanciaPercorrida(int distancia) {
    _distanciaPercorrida = distancia;
  }

  void calibrarPneu(int indexDoPneu) {
    this._rodas[indexDoPneu].setCalibragem(true);
  }

  void esvaziarPneu(int indexDoPneu) {
    this._rodas[indexDoPneu].setCalibragem(false);
  }
}
