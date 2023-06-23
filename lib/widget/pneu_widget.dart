import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PneuWidget extends StatefulWidget {
  final bool value;
  final Function(bool value) onTap;
  const PneuWidget({super.key, required this.onTap, required this.value});

  @override
  State<PneuWidget> createState() => _PneuWidgetState();
}

class _PneuWidgetState extends State<PneuWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> setState(() {
        widget.onTap.call(!widget.value);
      }),
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image.asset(
          "assets/images/icons/${widget.value ? "pneu_cheio" : "pneu_vazio"}.png",
        ),
      ),
    );
  }
}
