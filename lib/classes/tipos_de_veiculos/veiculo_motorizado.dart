import 'dart:math';

import 'package:simulador_de_corrida/classes/tipos_de_veiculos/bicicleta.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/carro_passeio.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/veiculo.dart';

import '../ipva.dart';
import 'carro_esportivo.dart';
import 'motocicleta.dart';

abstract class VeiculoMotorizado extends Veiculo with IPVA {
  //with serve para herança multipla

  static double _gastoMotocicleta = 0.25;
  static double _gastoCarroPasseio = 0.75;
  static double _gastoCarroEsportivo = 2.3;

  late bool _estaPagoIpva;
  late double _combustivelEmLitros;

  late double _valorIPVA;

  VeiculoMotorizado(super._id) {
    _combustivelEmLitros = 2.5;
    _valorIPVA =
        calcularIPVA()!; // a exclamação serve para tratamento de nulo, chamdo null check
    _estaPagoIpva = Random().nextBool();
  }

  double getConsumoPorBloco() {
    if (this is Motocicleta) {
      return _gastoMotocicleta;
    } else if (this is CarroPasseio) {
      return _gastoCarroPasseio;
    } else if (this is CarroEsportivo) {
      return _gastoCarroEsportivo;
    }
    return 0;
  }

  void abastecer(double combustivelEmLitros) {
    this._combustivelEmLitros = combustivelEmLitros;
  }

  void consumirCombustivel(double quantidadeDeCombustivelConsumido) {
    this._combustivelEmLitros -= quantidadeDeCombustivelConsumido;
  }

  double getQuantidadeDeCombustivel() => this._combustivelEmLitros;

  //isto é uma forma resumida de fazer uma função que retorna a propriedade do objeto
  bool getEstadoDoIpva() => _estaPagoIpva;

  void setEstadoDoIpva(bool valor) => this._estaPagoIpva = valor;
}
