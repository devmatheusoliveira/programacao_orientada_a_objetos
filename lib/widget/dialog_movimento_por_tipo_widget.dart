// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simulador_de_corrida/classes/simulador.dart';

class DialogMovimentoPorTipoWidget extends StatefulWidget {
  final Function(String value) onChanged;

  const DialogMovimentoPorTipoWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DialogMovimentoPorTipoWidget> createState() =>
      _DialogMovimentoPorTipoWidgetState();
}

class _DialogMovimentoPorTipoWidgetState
    extends State<DialogMovimentoPorTipoWidget> {
  bool isMoveRight = false;
  CarouselController controller = CarouselController();
  List<String> listaDeId = [
    "M", // Motocicleta
    "C", // Carro de passeio
    "E", // Carro esportivo
    "B", // Bicicleta
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: SizedBox(
        height: 200,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Mover por tipo:",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close_sharp,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (index > 0) {
                          index--;
                        }
                        controller.animateToPage(index);
                      },
                      icon: const Icon(
                        CupertinoIcons.arrowtriangle_left_fill,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: CarouselSlider(
                        options: CarouselOptions(height: 400.0),
                        carouselController: controller,
                        disableGesture: true,
                        items: listaDeId.map(
                          (i) {
                            String veiculoSelecionado = "";

                            switch (i) {
                              case 'M':
                                veiculoSelecionado = "moto";
                                break;
                              case 'C':
                                veiculoSelecionado = "carro_passeio";
                                break;
                              case 'E':
                                veiculoSelecionado = "carro_esportivo";
                                break;
                              case 'B':
                                veiculoSelecionado = "bicicleta";
                                break;
                              default:
                                null;
                            }

                            return Container(
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/cars/$veiculoSelecionado.png",
                                      height: 50,
                                      fit: BoxFit.contain,
                                      width: 50,
                                      filterQuality: FilterQuality.none,
                                    ),
                                    Text(
                                      veiculoSelecionado
                                          .replaceFirst(
                                            RegExp('${veiculoSelecionado[0]}'),
                                            veiculoSelecionado[0].toUpperCase(),
                                          )
                                          .replaceAll(r'_', '\n'),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (index < listaDeId.length - 1) {
                          index++;
                          controller.animateToPage(index);
                        }
                      },
                      icon: const Icon(
                        CupertinoIcons.arrowtriangle_right_fill,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const SizedBox(
                  width: double.maxFinite,
                  child: Text(
                    "Escolher veiculo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                onPressed: () {
                  Simulador.tipoDoVeiculo = listaDeId[index];

                  widget.onChanged(listaDeId[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
