import '../roda.dart';
import 'veiculo_motorizado.dart';

class Motocicleta extends VeiculoMotorizado {
  Motocicleta(super.id);

  //desenho foi subistituido pelo nome do arquivo que a interface irá printar
  @override
  String desenhar() => "moto";

  @override
  int getQuantidadeDeRodas() => 2;

  @override
  void mover() {
    bool todasRodasEstaoCalibradas = true;
    int movimentoPorQuantidadeDeLitros =
        super.getQuantidadeDeCombustivel() ~/ super.getConsumoPorBloco();
    const int quantidadeDeBlocosPorMovimento = 3;

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

    return "Motocicleta {id: ${getId()}, IPVA está pago: ${getEstadoDoIpva()}, valor do IPVA: ${super.calcularIPVA()}, Numero de rodas:  ${getQuantidadeDeRodas()}, Combustivel: ${getQuantidadeDeCombustivel()}  Estado das rodas: \n$rodas }";
  }
}
