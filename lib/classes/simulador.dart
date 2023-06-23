import 'package:simulador_de_corrida/classes/veiculo.dart';

class Simulador {
  static late int _idNovo;
  static late List<Veiculo> _veiculos = [];

  Simulador() {
    _idNovo = 0;
  }

  void _autoIncrementId() => _idNovo++;

  int getLastId() => _idNovo;
  List<Veiculo> getVeiculos() => _veiculos;

  int getQuantidadeDeVeiculos() => _veiculos.length;

  void incluirVeiculo() {
    Veiculo novoVeiculo = Veiculo(_idNovo);
    if (getQuantidadeDeVeiculos() < 20) {
      _veiculos.add(novoVeiculo);
      _autoIncrementId();
    }
  }

  void removerVeiculo(int id) {
    for (var i = 0; i < _veiculos.length; i++) {
      if (_veiculos[i].getId() == id) {
        _veiculos.remove(_veiculos[i]);
      }
    }
  }

  void abastecerVeiculo(int id, double quantidadeDeCombustivel) {
    for (Veiculo veiculo in _veiculos) {
      if (veiculo.getId() == id) {
        veiculo.setQuantidadeDeCombustivel(quantidadeDeCombustivel);
      }
    }
  }

  void abastecerTodosVeiculos(double quantidadeDeCombustivel) {
    for (Veiculo veiculo in _veiculos) {
      veiculo.setQuantidadeDeCombustivel(quantidadeDeCombustivel);
    }
  }

  void moverVeiculos() {
    for (Veiculo veiculo in _veiculos) {
      veiculo.moverVeiculo();
    }
  }

  void moverVeiculo(int id) {
    for (Veiculo veiculo in _veiculos) {
      if (veiculo.getId() == id) {
        veiculo.moverVeiculo();
        return;
        //pode ser feito o return pois sempre só terá 1,
        //então otimiza o algoritimo
      }
    }
  }

  void calibrarTodosPneus(int id) {
    for (Veiculo veiculo in _veiculos) {
      if (veiculo.getId() == id) {
        for (var indexDoPneu = 0;
            indexDoPneu < veiculo.getQuantidadeDeRodas();
            indexDoPneu++) {
          veiculo.calibrarPneu(indexDoPneu);
        }
      }
    }
  }

  void esvaziarTodosPneus(int id) {
    for (Veiculo veiculo in _veiculos) {
      if (veiculo.getId() == id) {
        for (var indexDoPneu = 0;
            indexDoPneu < veiculo.getQuantidadeDeRodas();
            indexDoPneu++) {
          veiculo.esvaziarPneu(indexDoPneu);
        }
      }
    }
  }

  void calibrarPneuEspecifico(int id, int indexDoPneu) {
    for (Veiculo veiculo in _veiculos) {
      if (veiculo.getId() == id) {
        veiculo.calibrarPneu(indexDoPneu);
      }
    }
  }

  void esvaziarPneuEspecifico(int id, int indexDoPneu) {
    for (Veiculo veiculo in _veiculos) {
      if (veiculo.getId() == id) {
        veiculo.esvaziarPneu(indexDoPneu);
      }
    }
  }

  //a interogação diz que o valor pode ser nulo
  bool? getEstadoDeRodaEspecifica(int id, int indexDoPneu) {
    for (Veiculo veiculo in _veiculos) {
      if (veiculo.getId() == id) {
        return veiculo.getRodas()[indexDoPneu].getCalibragem();
      }
    }
  }
}
