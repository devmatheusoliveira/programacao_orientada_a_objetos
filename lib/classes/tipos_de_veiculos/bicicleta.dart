import '../roda.dart';
import 'veiculo.dart';

class Bicicleta extends Veiculo {
  Bicicleta(super.id);

  //desenho foi subistituido pelo nome do arquivo que a interface irá printar
  @override
  String desenhar() => "bicicleta";

  @override
  void mover() {
    bool todasRodasEstaoCalibradas = true;

    for (Roda roda in super.getRodas()) {
      if (roda.getCalibragem() == false) {
        todasRodasEstaoCalibradas = false;
        return;
      }
    }

    if (todasRodasEstaoCalibradas) {
      super.setDistanciaPercorrida(super.getDistanciaPercorrida() + 2);
    }
  }

  @override
  int getQuantidadeDeRodas() => 2;

  @override
  String toString() {
    String rodas = "\n";
    for (int i = 0; i < super.getRodas().length; i++) {
      rodas += "\t${i}: ${super.getRodas()[i].toString()}\n";
    }

    return "Bicicleta {\nid: ${super.getId()}, \nNão tem ipva, \nNumero de rodas:  ${getQuantidadeDeRodas()}, \nEstado das rodas: \n$rodas }";
  }
}
