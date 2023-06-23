import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CarroWidget extends StatefulWidget {
  final double posicaoFinal;
  final int velocidade;
  final String modelo;
  final VoidCallback onTap;
  final String id;
  const CarroWidget(
      {super.key,
      required this.posicaoFinal,
      required this.velocidade,
      required this.modelo,
      required this.onTap,
      required this.id});

  @override
  State<CarroWidget> createState() => _CarroWidgetState();
}

class _CarroWidgetState extends State<CarroWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: (widget.posicaoFinal.toInt()) ~/ 100),
      width: 50 + widget.posicaoFinal,
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: 50,
          width: 50,
          child: InkWell(
            onTap: () => widget.onTap.call(),
            child: Badge(
              label: Text(widget.id),
              child: Image.asset(
                "assets/images/cars/${widget.modelo}.png",
                width: 50,
                height: 50,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
