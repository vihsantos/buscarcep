import 'package:flutter/material.dart';

class LinhaCardEndereco extends StatelessWidget {
  const LinhaCardEndereco({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            value ?? 'Não informado!',
            maxLines: 2,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 13,
            ),
          ),
        )
      ],
    );
  }
}
