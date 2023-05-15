import 'package:flutter/material.dart';

class VisualizarMapaButton extends StatelessWidget {
  const VisualizarMapaButton({
    Key? key,
    required this.function,
  }) : super(key: key);

  final Function function;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function as void Function()?,
        child: const Text(
          "Clique aqui \npara visualizar o mapa",
          textAlign: TextAlign.center,
        ));
  }
}
