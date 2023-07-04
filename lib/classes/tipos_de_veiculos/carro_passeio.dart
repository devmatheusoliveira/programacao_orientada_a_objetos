import 'package:simulador_de_corrida/classes/ipva.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/veiculo_motorizado.dart';

import '../roda.dart';

class CarroPasseio extends VeiculoMotorizado {
  CarroPasseio(super._id);

  //desenho foi subistituido pelo nome do arquivo que a interface irá printar
  @override
  String desenhar() => "carro_passeio";

  @override
  int getQuantidadeDeRodas() => 4;

  @override
  void mover() {
    bool todasRodasEstaoCalibradas = true;
    int movimentoPorQuantidadeDeLitros =
        super.getQuantidadeDeCombustivel() ~/ 0.75;
    const int quantidadeDeBlocosPorMovimento = 5;

    for (Roda roda in super.getRodas()) {
      if (roda.getCalibragem() == false) {
        todasRodasEstaoCalibradas = false;
        return;
      }
    }
    if (super.getEstadoDoIpva() == false ||
        todasRodasEstaoCalibradas == false ||
        super.getQuantidadeDeCombustivel() <= 0) return;

    if (movimentoPorQuantidadeDeLitros >= quantidadeDeBlocosPorMovimento) {
      super.setDistanciaPercorrida(
          getDistanciaPercorrida() + quantidadeDeBlocosPorMovimento);
      super.consumirCombustivel(quantidadeDeBlocosPorMovimento * 0.75);
    } else {
      super.setDistanciaPercorrida(
          getDistanciaPercorrida() + movimentoPorQuantidadeDeLitros);
      super.consumirCombustivel(movimentoPorQuantidadeDeLitros * 0.75);
    }
  }

  @override
  String toString() {
    String rodas = "";
    for (int i = 0; i < super.getRodas().length; i++) {
      rodas += "\t${i}: ${super.getRodas()[i].toString()}\n";
    }

    return "Carro Passeio {id: ${getId()}, IPVA está pago: ${getEstadoDoIpva()}, valor do IPVA: ${super.calcularIPVA()}, Numero de rodas:  ${getQuantidadeDeRodas()}, Combustivel: ${getQuantidadeDeCombustivel()}  Estado das rodas: \n$rodas }";
  }
}
