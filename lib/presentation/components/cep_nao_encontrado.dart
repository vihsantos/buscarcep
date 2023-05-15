import 'package:flutter/material.dart';
import '../core/paleta_de_cores.dart';

class CepNaoEncontrado extends StatelessWidget {
  const CepNaoEncontrado({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.98,
      decoration: BoxDecoration(
          color: PaletaDeCores.branco, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Icon(
            Icons.error_outline,
            size: 69,
            color: PaletaDeCores.vermelho,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Cep não encontrado! Verifique se você digitou o cep corretamente!",
            textAlign: TextAlign.center,
            style: TextStyle(color: PaletaDeCores.preto),
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
