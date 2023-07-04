import 'package:flutter/material.dart';
import 'package:simulador_de_corrida/classes/simulador.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/bicicleta.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/carro_esportivo.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/carro_passeio.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/motocicleta.dart';
import 'package:simulador_de_corrida/classes/tipos_de_veiculos/veiculo_motorizado.dart';
import 'package:simulador_de_corrida/widget/carro_widget.dart';
import 'package:simulador_de_corrida/widget/dialog_calibrar_por_tipo_widget.dart';
import 'package:simulador_de_corrida/widget/dialog_imprimir_por_tipo_widget.dart';
import 'package:simulador_de_corrida/widget/dialog_movimento_por_tipo_widget.dart';
import 'package:simulador_de_corrida/widget/dialog_seleciona_veiculo_widget.dart';
import 'package:simulador_de_corrida/widget/pneu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double position = 0;

  double combustivel = 9.9;
  late Simulador simulador = Simulador();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: DialogMovimentoPorTipoWidget(
                      onChanged: (modelo) {
                        Navigator.pop(context);

                        setState(() {
                          switch (modelo) {
                            case "M":
                              simulador.moverVeiculosDeUmTipoEspecifico(
                                  Motocicleta(-1));
                              break;
                            case "C":
                              simulador.moverVeiculosDeUmTipoEspecifico(
                                  CarroPasseio(-1));
                              break;
                            case "E":
                              simulador.moverVeiculosDeUmTipoEspecifico(
                                  CarroEsportivo(-1));
                              break;
                            case "B":
                              simulador.moverVeiculosDeUmTipoEspecifico(
                                  Bicicleta(-1));

                              break;
                            default:
                          }
                        });
                      },
                    ),
                  );
                },
              );
            },
            child: const Text(
              "Mover veiculos por tipo",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 2,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: DialogCalibrarPorTipoWidget(
                      onChanged1: (modelo) {
                        Navigator.pop(context);

                        setState(() {
                          switch (modelo) {
                            case "M":
                              simulador.calibrarTodosPneusDeMesmoTipoDeVeiculos(
                                  Motocicleta(-1));
                              break;
                            case "C":
                              simulador.calibrarTodosPneusDeMesmoTipoDeVeiculos(
                                  CarroPasseio(-1));
                              break;
                            case "E":
                              simulador.calibrarTodosPneusDeMesmoTipoDeVeiculos(
                                  CarroEsportivo(-1));
                              break;
                            case "B":
                              simulador.calibrarTodosPneusDeMesmoTipoDeVeiculos(
                                  Bicicleta(-1));

                              break;
                            default:
                          }
                        });
                      },
                      onChanged2: (modelo) {
                        Navigator.pop(context);

                        setState(() {
                          switch (modelo) {
                            case "M":
                              simulador.esvaziarTodosPneusDeMesmoTipo(
                                  Motocicleta(-1));
                              break;
                            case "C":
                              simulador.esvaziarTodosPneusDeMesmoTipo(
                                  CarroPasseio(-1));
                              break;
                            case "E":
                              simulador.esvaziarTodosPneusDeMesmoTipo(
                                  CarroEsportivo(-1));
                              break;
                            case "B":
                              simulador
                                  .esvaziarTodosPneusDeMesmoTipo(Bicicleta(-1));

                              break;
                            default:
                          }
                        });
                      },
                    ),
                  );
                },
              );
            },
            child: const Text(
              "Calibrar/esvaziar por tipo",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 2,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: DialogImprimirPorTipoWidget(
                      onChanged1: (modelo) {
                        Navigator.pop(context);

                        simulador.imprimirTodos();
                      },
                      onChanged2: (modelo) {
                        Navigator.pop(context);

                        setState(() {
                          switch (modelo) {
                            case "M":
                              simulador
                                  .imprimirTodosDeMesmoTipo(Motocicleta(-1));
                              break;
                            case "C":
                              simulador
                                  .imprimirTodosDeMesmoTipo(CarroPasseio(-1));
                              break;
                            case "E":
                              simulador
                                  .imprimirTodosDeMesmoTipo(CarroEsportivo(-1));
                              break;
                            case "B":
                              simulador.imprimirTodosDeMesmoTipo(Bicicleta(-1));

                              break;
                            default:
                          }
                        });
                      },
                    ),
                  );
                },
              );
            },
            child: const Text(
              "Imprimir",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 2,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: () {
              setState(
                () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        content: SelecaoDeVeiculoWidget(
                          onChanged: (modelo) {
                            Navigator.pop(context);

                            setState(() {
                              simulador.incluirVeiculo();
                            });
                          },
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: const Text(
              "Adicionar veículo",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 2,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: () {
              setState(
                () {
                  simulador.moverVeiculos();
                },
              );
            },
            child: const Text(
              "Mover todos",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 2,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              color: Colors.black.withOpacity(0.7),
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int indexDasFaixas = 0;
                        indexDasFaixas < simulador.getQuantidadeDeVeiculos();
                        indexDasFaixas++)
                      CarroWidget(
                        id: simulador
                            .getVeiculos()[indexDasFaixas]
                            .getId()
                            .toString(),
                        posicaoFinal: simulador
                                .getVeiculos()[indexDasFaixas]
                                .getDistanciaPercorrida() *
                            50,
                        velocidade: 2,
                        modelo:
                            simulador.getVeiculos()[indexDasFaixas].desenhar(),
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => StatefulBuilder(
                            builder: (context, setStateBuilder) {
                              return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      simulador.removerVeiculo(simulador
                                          .getVeiculos()[indexDasFaixas]
                                          .getId());
                                      Navigator.pop(context);

                                      setState(() {});
                                    },
                                    child: const Text(
                                      'Remover veículo',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        simulador
                                            .getVeiculos()[indexDasFaixas]
                                            .mover();
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: const Text('Mover'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                                content: Container(
                                  height: 200,
                                  width: 200,
                                  color:
                                      const Color.fromARGB(255, 52, 219, 149),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            for (int indexDoPneu = 0;
                                                indexDoPneu <
                                                    simulador
                                                        .getVeiculos()[
                                                            indexDasFaixas]
                                                        .getQuantidadeDeRodas();
                                                indexDoPneu++)
                                              Badge(
                                                label:
                                                    Text("Pneu $indexDoPneu"),
                                                child: PneuWidget(
                                                  onTap: (value) {
                                                    setStateBuilder(() {
                                                      if (value) {
                                                        simulador.calibrarPneuEspecifico(
                                                            simulador
                                                                .getVeiculos()[
                                                                    indexDasFaixas]
                                                                .getId(),
                                                            indexDoPneu);
                                                      } else {
                                                        simulador.esvaziarPneuEspecifico(
                                                            simulador
                                                                .getVeiculos()[
                                                                    indexDasFaixas]
                                                                .getId(),
                                                            indexDoPneu);
                                                      }
                                                    });
                                                  },
                                                  value: simulador
                                                      .getEstadoDeRodaEspecifica(
                                                          simulador
                                                              .getVeiculos()[
                                                                  indexDasFaixas]
                                                              .getId(),
                                                          indexDoPneu)!,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      if (simulador
                                              .getVeiculos()[indexDasFaixas]
                                          is VeiculoMotorizado)
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 35,
                                                width: 35,
                                                child: Image.asset(
                                                  "assets/images/icons/gasolina.png",
                                                ),
                                              ),
                                              if (simulador.getVeiculos()[
                                                      indexDasFaixas]
                                                  is VeiculoMotorizado)
                                                SizedBox(
                                                  width: 225,
                                                  child: Slider(
                                                    min: 0,
                                                    max: 9.9,
                                                    value: (simulador
                                                                    .getVeiculos()[
                                                                indexDasFaixas]
                                                            as VeiculoMotorizado)
                                                        .getQuantidadeDeCombustivel(),
                                                    divisions: 18,
                                                    thumbColor:
                                                        const Color(0xfff39c12),
                                                    activeColor: const Color(
                                                        0xfffe67e22),
                                                    onChanged: (value) {
                                                      setStateBuilder(
                                                        () {
                                                          simulador.abastecerVeiculo(
                                                              simulador
                                                                  .getVeiculos()[
                                                                      indexDasFaixas]
                                                                  .getId(),
                                                              value);
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      if (simulador
                                              .getVeiculos()[indexDasFaixas]
                                          is VeiculoMotorizado)
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text((simulador.getVeiculos()[
                                                          indexDasFaixas]
                                                      as VeiculoMotorizado)
                                                  .getEstadoDoIpva()
                                              ? "IPVA está pago"
                                              : "IPVA não está pago"),
                                        )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
