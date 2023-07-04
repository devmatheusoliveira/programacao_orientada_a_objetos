import 'package:simulador_de_corrida/classes/tipos_de_veiculos/bicicleta.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/carro_esportivo.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/carro_passeio.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/motocicleta.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/veiculo_motorizado.dart';

import 'tipos_de_veiculos/veiculo.dart';

class Simulador {
  static late int _idNovo;
  static String tipoDoVeiculo = "";
  static List<Veiculo> _veiculos = [];

  Simulador() {
    _idNovo = 0;
  }

  void _autoIncrementId() => _idNovo++;

  int getLastId() => _idNovo;
  List<Veiculo> getVeiculos() => _veiculos;

  int getQuantidadeDeVeiculos() => _veiculos.length;

  void incluirVeiculo() {
    late Veiculo novoVeiculo;
    switch (tipoDoVeiculo) {
      case 'M':
        novoVeiculo = Motocicleta(_idNovo);
        break;
      case 'C':
        novoVeiculo = CarroPasseio(_idNovo);
        break;
      case 'E':
        novoVeiculo = CarroEsportivo(_idNovo);
        break;
      case 'B':
        novoVeiculo = Bicicleta(_idNovo);
        break;
      default:
        null;
    }

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
      // o "as" serve para tipar o veiculo como veiculo motorizado, liberando assim seus metodos
      if (veiculo.getId() == id) {
        (veiculo as VeiculoMotorizado).abastecer(quantidadeDeCombustivel);
      }
    }
  }

  void abastecerTodosVeiculos(double quantidadeDeCombustivel) {
    for (Veiculo veiculo in _veiculos) {
      // o "as" serve para tipar o veiculo como veiculo motorizado, liberando assim seus metodos
      (veiculo as VeiculoMotorizado).abastecer(quantidadeDeCombustivel);
    }
  }

  void moverVeiculos() {
    for (Veiculo veiculo in _veiculos) {
      veiculo.mover();
    }
  }

  void moverVeiculosDeUmTipoEspecifico(dynamic exemplo) {
    String desenho = "";
    // o is corresponde ao instanceof
    // ou seja, estou comparando o tipo
    if (exemplo is Motocicleta) {
      desenho = exemplo.desenhar();
    } else if (exemplo is CarroPasseio) {
      desenho = exemplo.desenhar();
    } else if (exemplo is CarroEsportivo) {
      desenho = exemplo.desenhar();
    } else if (exemplo is Bicicleta) {
      desenho = exemplo.desenhar();
    } else {}

    for (Veiculo veiculo in _veiculos) {
      if (veiculo.desenhar() == desenho) veiculo.mover();
    }
  }

  void moverVeiculo(int id) {
    for (Veiculo veiculo in _veiculos) {
      if (veiculo.getId() == id) {
        veiculo.mover();
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

  void calibrarTodosPneusDeMesmoTipoDeVeiculos(dynamic exemplo) {
    String desenho = "";
    // o is corresponde ao instanceof
    // ou seja, estou comparando o tipo
    if (exemplo is Motocicleta) {
      desenho = exemplo.desenhar();
    } else if (exemplo is CarroPasseio) {
      desenho = exemplo.desenhar();
    } else if (exemplo is CarroEsportivo) {
      desenho = exemplo.desenhar();
    } else if (exemplo is Bicicleta) {
      desenho = exemplo.desenhar();
    } else {}

    for (Veiculo veiculo in _veiculos) {
      for (var indexDoPneu = 0;
          indexDoPneu < veiculo.getQuantidadeDeRodas();
          indexDoPneu++) {
        if (veiculo.desenhar() == desenho) veiculo.calibrarPneu(indexDoPneu);
      }
    }
  }

  void esvaziarTodosPneusDeMesmoTipo(dynamic exemplo) {
    String desenho = "";
    // o is corresponde ao instanceof
    // ou seja, estou comparando o tipo
    if (exemplo is Motocicleta) {
      desenho = exemplo.desenhar();
    } else if (exemplo is CarroPasseio) {
      desenho = exemplo.desenhar();
    } else if (exemplo is CarroEsportivo) {
      desenho = exemplo.desenhar();
    } else if (exemplo is Bicicleta) {
      desenho = exemplo.desenhar();
    } else {}

    for (Veiculo veiculo in _veiculos) {
      for (var indexDoPneu = 0;
          indexDoPneu < veiculo.getQuantidadeDeRodas();
          indexDoPneu++) {
        if (veiculo.desenhar() == desenho) veiculo.esvaziarPneu(indexDoPneu);
      }
    }
  }

  void imprimirTodos() {
    for (Veiculo veiculo in _veiculos) {
      print("${veiculo.toString()}\n");
    }
  }

  void imprimirTodosDeMesmoTipo(dynamic exemplo) {
    String desenho = "";
    // o is corresponde ao instanceof
    // ou seja, estou comparando o tipo
    if (exemplo is Motocicleta) {
      desenho = exemplo.desenhar();
    } else if (exemplo is CarroPasseio) {
      desenho = exemplo.desenhar();
    } else if (exemplo is CarroEsportivo) {
      desenho = exemplo.desenhar();
    } else if (exemplo is Bicicleta) {
      desenho = exemplo.desenhar();
    } else {}

    for (Veiculo veiculo in _veiculos) {
      if (veiculo.desenhar() == desenho) print("${veiculo.toString()}\n");
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
