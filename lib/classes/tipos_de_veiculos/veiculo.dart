// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../ipva.dart';
import '../roda.dart';

abstract class Veiculo {
  int _id;
  late List<Roda> _rodas;
  late int _quantidadeDeRodas;
  int distanciaPercorrida = 0;

  Veiculo(this._id) {
    //construtor
  }

  String toString() {
    return "teste 123";
  }

  // no flutter não precisa de abstract antes de funcoes
  String desenhar();
  void mover();
}
