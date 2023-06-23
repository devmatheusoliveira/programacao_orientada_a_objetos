import '../roda.dart';
import 'veiculo.dart';

class Bicicleta extends Veiculo {
  late String _nomeDoDesenho;
  late List<Roda> _rodas = [];

  late int _quantidadeDeRodas;

  Bicicleta(super.id);

  @override
  void mover() {
    bool todasRodasEstaoCalibradas = true;
    for (Roda roda in _rodas) {
      if (roda.getCalibragem() == false) {
        todasRodasEstaoCalibradas = false;
        return;
      }
    }

    if (todasRodasEstaoCalibradas) super.distanciaPercorrida = 2;
  }

  @override
  String desenhar() {
    return "";
  }
}
