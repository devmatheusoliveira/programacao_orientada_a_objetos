import 'dart:math';

import 'package:simulador_de_corrida/classes/roda.dart';
import 'package:simulador_de_corrida/classes/simulador.dart';

class Veiculo {
  int _id;
  late String _nomeDoDesenho;
  late List<Roda> _rodas = [];
  late bool _estaPagoIpva;
  late double _combustivelEmLitros;
  int _quantidadeDeRodas = 4;
  late int _distanciaPercorrida;

  // O this._id no parametro do construtor e a mesma coisa
  // que fazer this._id = id "id do parametro"
  Veiculo(this._id) {
    List<String> veiculosNomes = [
      "buggy",
      'kart',
      'convertible',
      'hotdog',
      'police',
      'vintage',
      'vendor',
      'suv',
      'sports_green',
      'sports_race',
      'sports_red',
      'sports_yellow',
      'suv_military',
      'sedan_vintage',
    ];
    _setEstadoDasRodas();
    setQuantidadeDeCombustivel(2.5);
    _distanciaPercorrida = 0;
    _nomeDoDesenho = veiculosNomes[Random().nextInt(veiculosNomes.length)];

    _estaPagoIpva = Random().nextBool();
  }

  String getNomeDoDesenho() => _nomeDoDesenho;

  void setPropriedades(
    String nomeDoDesenho,
    bool estaPagoIpva,
    int quantidadeDeRodas,
  ) {
    this._nomeDoDesenho = nomeDoDesenho;
    this._estaPagoIpva = estaPagoIpva;
    this._quantidadeDeRodas = quantidadeDeRodas;
    this._nomeDoDesenho = nomeDoDesenho;
  }

  int getDistanciaPercorrida() => _distanciaPercorrida;

  int getId() => this._id;

  List<Roda> getRodas() => _rodas;

  int getQuantidadeDeRodas() => this._quantidadeDeRodas;

  void _setEstadoDasRodas() {
    for (int indexRoda = 0; indexRoda < this._quantidadeDeRodas; indexRoda++) {
      Roda roda = Roda();
      _rodas.add(roda);
    }
  }

  void setQuantidadeDeCombustivel(double combustivelEmLitros) {
    this._combustivelEmLitros = combustivelEmLitros;
  }

  double getQuantidadeDeCombustivel() {
    return this._combustivelEmLitros;
  }

  //isto é uma forma resumida de fazer uma função que retorna a propriedade do objeto
  bool getEstadoDoIpva() => _estaPagoIpva;

  void setEstadoDoIpva(estaPagoIpva) => this._estaPagoIpva = estaPagoIpva;

  void moverVeiculo() {
    bool todasRodasEstaoCalibradas = true;
    for (Roda roda in _rodas) {
      if (roda.getCalibragem() == false) {
        todasRodasEstaoCalibradas = false;
        return;
      }
    }

    if (_estaPagoIpva && todasRodasEstaoCalibradas) {
      int movimentoPorQuantidadeDeLitros = this._combustivelEmLitros ~/ 0.55;
      this._distanciaPercorrida += movimentoPorQuantidadeDeLitros;
      print(movimentoPorQuantidadeDeLitros);
      this._combustivelEmLitros -= movimentoPorQuantidadeDeLitros * 0.55;
    }
  }

  void calibrarPneu(int indexDoPneu) {
    this._rodas[indexDoPneu].setCalibragem(true);
  }

  void esvaziarPneu(int indexDoPneu) {
    this._rodas[indexDoPneu].setCalibragem(false);
  }

  String toString() {
    return "Id:$_id \n\tNome do desenho: $_nomeDoDesenho \n\tEstado do IPVA: $_estaPagoIpva \n\tDistancia Percorrida: $_distanciaPercorrida";
  }
}
