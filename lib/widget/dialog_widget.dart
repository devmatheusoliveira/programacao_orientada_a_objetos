import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simulador_de_corrida/widget/pneu_widget.dart';

class dsfa extends StatefulWidget {
  final List<Widget> actions;
  const dsfa({super.key, required this.actions});

  @override
  State<dsfa> createState() => _dsfaState();
}

class _dsfaState extends State<dsfa> {
  double combustivel = 9.9;

  List<bool> pneus = [false, false, true, true];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      actions: widget.actions,
      content: Container(
        height: 200,
        width: 200,
        color: const Color.fromARGB(255, 52, 219, 149),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Badge(
                    label: const Text("Peneu 1"),
                    child: PneuWidget(
                      onTap: (value) {
                        setState(() {
                          pneus[0] = value;
                        });
                      },
                      value: pneus[0],
                    ),
                  ),
                  Badge(
                    label: const Text("Peneu 2"),
                    child: PneuWidget(
                      onTap: (value) {
                        setState(() {
                          pneus[1] = value;
                        });
                      },
                      value: pneus[1],
                    ),
                  ),
                  Badge(
                    label: const Text("Peneu 3"),
                    child: PneuWidget(
                      onTap: (value) {
                        setState(() {
                          pneus[2] = value;
                        });
                      },
                      value: pneus[2],
                    ),
                  ),
                  Badge(
                    label: const Text("Peneu 4"),
                    child: PneuWidget(
                      onTap: (value) {
                        setState(() {
                          pneus[3] = value;
                        });
                      },
                      value: pneus[3],
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
                      value: combustivel,
                      divisions: 18,
                      thumbColor: Color(0xfff39c12),
                      activeColor: Color(0xfffe67e22),
                      onChangeStart: (value) {
                        setState(() {
                          combustivel = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          combustivel = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
