import 'package:flutter/material.dart';
import 'package:agillock_client_app/widgets/app_bar_cabecalho.dart';
import 'package:agillock_client_app/pages/cancelar_page.dart';

class AnexaImageVeiculoPage extends StatefulWidget {
  const AnexaImageVeiculoPage({super.key});

  @override
  _AnexaImageVeiculoPageState createState() => _AnexaImageVeiculoPageState();
}

class _AnexaImageVeiculoPageState extends State<AnexaImageVeiculoPage> {
  final List<String> categorias = [
    "Frente",
    "Traseira",
    "Lateral Direita",
    "Lateral Esquerda",
    "Interior",
    "Motor"
  ];
  final Map<String, String?> imagens = {};

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarCabecalho(size: size),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double fontSize = constraints.maxWidth * 0.05;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1,
                    ),
                    itemCount: categorias.length,
                    itemBuilder: (context, index) {
                      String categoria = categorias[index];
                      return Column(
                        children: [
                          Text(
                            categoria,
                            style: TextStyle(
                              fontSize: fontSize * 0.7,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              // Implementar captura de imagem
                            },
                            child: Container(
                              height: constraints.maxWidth * 0.4,
                              width: constraints.maxWidth * 0.4,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[800],
                              ),
                              child: imagens[categoria] != null
                                  ? Stack(
                                children: [
                                  Image.network(
                                    imagens[categoria]!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          imagens[categoria] = null;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                                  : const Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CancelarPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(fontSize: fontSize * 0.9),
                      backgroundColor: const Color(0xFFFE492D),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Cancelar"),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Implementar envio
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(fontSize: fontSize * 0.9),
                      backgroundColor: const Color(0xFFFEB22D),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Enviar"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
