import 'package:busca_cep/presentation/pages/itens_salvos_page.dart';
import 'package:flutter/material.dart';

import '../core/paleta_de_cores.dart';
import 'busca_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int indexSelecionado = 0;

  final pages = const [BuscaPage(), ItensSalvosPage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              currentIndex: indexSelecionado,
              onTap: (index) {
                setState(() {
                  indexSelecionado = index;
                });
              },
              selectedItemColor: PaletaDeCores.verdeEscuro,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Buscar Cep"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check), label: "Ceps Salvos"),
              ]),
          backgroundColor: PaletaDeCores.azulClaro,
          body: pages[indexSelecionado]),
    );
  }
}
