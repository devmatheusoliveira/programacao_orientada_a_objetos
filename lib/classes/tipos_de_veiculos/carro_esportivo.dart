import 'package:simulador_de_corrida/classes/ipva.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/veiculo.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/veiculo_motorizado.dart';

import '../roda.dart';

class CarroEsportivo extends VeiculoMotorizado {
  CarroEsportivo(super._id);

  //desenho foi subistituido pelo nome do arquivo que a interface irá printar
  @override
  String desenhar() => "carro_esportivo";

  @override
  int getQuantidadeDeRodas() => 4;

  @override
  void mover() {
    bool todasRodasEstaoCalibradas = true;
    int movimentoPorQuantidadeDeLitros =
        super.getQuantidadeDeCombustivel() ~/ super.getConsumoPorBloco();
    const int quantidadeDeBlocosPorMovimento = 10;

    // TODO: implement mover
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
      super.consumirCombustivel(
          quantidadeDeBlocosPorMovimento * super.getConsumoPorBloco());
    } else {
      super.setDistanciaPercorrida(
          getDistanciaPercorrida() + movimentoPorQuantidadeDeLitros);
      super.consumirCombustivel(
          movimentoPorQuantidadeDeLitros * super.getConsumoPorBloco());
    }
  }

  @override
  String toString() {
    String rodas = "";
    for (int i = 0; i < super.getRodas().length; i++) {
      rodas += "\t${i}: ${super.getRodas()[i].toString()}\n";
    }

    return "Carro esportivo {id: ${getId()}, \nIPVA está pago: ${getEstadoDoIpva()}, valor do IPVA: ${super.calcularIPVA()}, Numero de rodas:  ${getQuantidadeDeRodas()}, Combustivel: ${getQuantidadeDeCombustivel()}  Estado das rodas: \n$rodas }";
  }
}
