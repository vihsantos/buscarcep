import 'package:flutter/material.dart';
import '../../models/endereco.dart';
import '../core/paleta_de_cores.dart';
import 'linha_card_endereco.dart';

class CardEndereco extends StatelessWidget {
  const CardEndereco({
    Key? key,
    required this.endereco,
    this.child,
  }) : super(key: key);

  final Endereco endereco;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: const EdgeInsets.only(top: 10),
        width: size.width * 0.98,
        decoration: BoxDecoration(
            color: PaletaDeCores.branco,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LinhaCardEndereco(
                  label: "CEP:",
                  value: endereco.cep?.replaceAllMapped(
                      RegExp(r"(^\d{5})-?(\d{3})"),
                      (n) => "${n.group(1)}-${n.group(2)}")),
              LinhaCardEndereco(
                  label: "Logradouro:", value: endereco.logradouro),
              LinhaCardEndereco(
                  label: "Complemento:", value: endereco.complemento),
              LinhaCardEndereco(label: "Bairro:", value: endereco.bairro),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LinhaCardEndereco(
                      label: "Cidade:", value: endereco.cidade?.nome),
                  LinhaCardEndereco(
                      label: "Estado:", value: endereco.estado?.sigla),
                ],
              ),
              if (child != null) child!
            ],
          ),
        ));
  }
}
