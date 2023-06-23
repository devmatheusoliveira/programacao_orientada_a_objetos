import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simulador_de_corrida/classes/simulador.dart';
import 'package:simulador_de_corrida/classes/veiculo.dart';
import 'package:simulador_de_corrida/widget/carro_widget.dart';
import 'package:simulador_de_corrida/widget/dialog_widget.dart';
import 'package:simulador_de_corrida/widget/pneu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double position = 0;
  Veiculo veiculo = Veiculo(1);
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 2,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                simulador.incluirVeiculo();
              });
            },
            child: Text(
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
              setState(() {
                simulador.moverVeiculos();
              });
            },
            child: Text(
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
                        modelo: simulador
                            .getVeiculos()[indexDasFaixas]
                            .getNomeDoDesenho(),
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
                                            .moverVeiculo();
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
                                                indexDoPneu < 4;
                                                indexDoPneu++)
                                              Badge(
                                                label: Text("Pneu " +
                                                    indexDoPneu.toString()),
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
                                            SizedBox(
                                              width: 225,
                                              child: Slider(
                                                min: 0,
                                                max: 9.9,
                                                value: simulador
                                                    .getVeiculos()[
                                                        indexDasFaixas]
                                                    .getQuantidadeDeCombustivel(),
                                                divisions: 18,
                                                thumbColor: Color(0xfff39c12),
                                                activeColor: Color(0xfffe67e22),
                                                onChanged: (value) {
                                                  setStateBuilder(() {
                                                    simulador.abastecerVeiculo(
                                                        simulador
                                                            .getVeiculos()[
                                                                indexDasFaixas]
                                                            .getId(),
                                                        value);
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(simulador
                                                .getVeiculos()[indexDasFaixas]
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
