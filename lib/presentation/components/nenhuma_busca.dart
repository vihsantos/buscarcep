import 'package:flutter/material.dart';
import '../core/paleta_de_cores.dart';

class NenhumaBusca extends StatelessWidget {
  const NenhumaBusca({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.98,
      decoration: BoxDecoration(
          color: PaletaDeCores.branco, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Icon(Icons.warning_amber_outlined,
                size: 69, color: PaletaDeCores.amarelo),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Por enquanto nenhum CEP pesquisado. Estamos aguardando sua solicitação!",
              textAlign: TextAlign.center,
              style: TextStyle(color: PaletaDeCores.preto),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
