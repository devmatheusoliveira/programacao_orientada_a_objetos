import 'package:simulador_de_corrida/classes/tipos_de_veiculos/carro_esportivo.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/carro_passeio.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/motocicleta.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/veiculo_motorizado.dart';

abstract class IPVA {
  //interfaces no dart também são implementadas com
  //abstract class

  final double aliquotaCarroPasseio = 1.3;
  final double aliquotaMotocicleta = 0.75;
  final double aliquotaCarroEsportivo = 3.15;

  double valorBase = 500.00;

  double? calcularIPVA() {
    // o is corresponde ao instanceof
    // ou seja, estou comparando o tipo
    if (this is Motocicleta) {
      return valorBase * aliquotaMotocicleta;
    } else if (this is CarroPasseio) {
      return valorBase * aliquotaCarroPasseio;
    } else if (this is CarroEsportivo) {
      return valorBase * aliquotaCarroEsportivo;
    }
    return null;
  }
}
