import 'package:busca_cep/models/endereco.dart';
import 'package:busca_cep/presentation/components/card_endereco.dart';
import 'package:busca_cep/presentation/components/cep_nao_encontrado.dart';
import 'package:busca_cep/presentation/controllers/busca_controller.dart';
import 'package:busca_cep/presentation/core/paleta_de_cores.dart';
import 'package:busca_cep/presentation/pages/ver_mapa.dart';
import 'package:busca_cep/repository/buscar_cep_repository.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../components/app_bar.dart';
import '../components/nenhuma_busca.dart';
import '../components/visualizar_mapa_button.dart';

class BuscaPage extends StatefulWidget {
  const BuscaPage({super.key});

  @override
  State<BuscaPage> createState() => _BuscaPageState();
}

class _BuscaPageState extends State<BuscaPage> {
  BuscaController controller =
      BuscaController(repository: BuscarCepRepository());
  var cep = '';

  var maskFormatter = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar("Buscar Cep"),
      backgroundColor: PaletaDeCores.azulClaro,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Olá, bem vindo de volta!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Para encontrar o cep desejado, basta inserir o numero no campo abaixo e apertar no botão de buscar.",
                textAlign: TextAlign.justify,
                maxLines: 3,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: size.width * 0.96,
                height: size.height * 0.085,
                decoration: BoxDecoration(
                    color: PaletaDeCores.branco,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.6,
                      height: size.height * 0.082,
                      child: Center(
                        child: TextFormField(
                          onChanged: (value) => {cep = value},
                          keyboardType: TextInputType.number,
                          inputFormatters: [maskFormatter],
                          decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Digite o cep"),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: PaletaDeCores.verdeClaro,
                            minimumSize:
                                Size(size.width * 0.26, size.height * 0.07),
                            maximumSize:
                                Size(size.width * 0.26, size.height * 0.07)),
                        onPressed: () {
                          controller.buscarCep(cep);
                        },
                        child: const Text(
                          "Buscar",
                          style: TextStyle(fontSize: 16),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ValueListenableBuilder(
                  valueListenable: controller.loadingApi,
                  builder: ((context, loading, child) {
                    if (loading) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (controller.error?.statusCode == 404) {
                      return const CepNaoEncontrado();
                    }

                    if (controller.endereco == null) {
                      return const NenhumaBusca();
                    }

                    Endereco? endereco = controller.endereco;
                    return Column(
                      children: [
                        CardEndereco(
                          endereco: endereco!,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        maximumSize: Size(size.width * 0.25,
                                            size.height * 0.06)),
                                    onPressed: () {
                                      controller.salvarEndereco(endereco);
                                    },
                                    child: const Text("Salvar")),
                                VisualizarMapaButton(
                                  function: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => VerMapa(
                                                  latitude: double.parse(
                                                      endereco.latitude!),
                                                  longitude: double.parse(
                                                      endereco.longitude!),
                                                )));
                                  },
                                )
                              ]),
                        ),
                      ],
                    );
                  }))
              //CardEndereco(endereco: teste)
            ],
          ),
        ),
      ),
    );
  }
}
