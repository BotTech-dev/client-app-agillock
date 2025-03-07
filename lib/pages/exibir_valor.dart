import 'package:flutter/material.dart';
import 'package:agillock_client_app/widgets/app_bar_cabecalho.dart';
import 'package:agillock_client_app/pages/cancelar_page.dart';
import 'package:agillock_client_app/pages/anexo_documento_page.dart';

class ExibirValorPage extends StatefulWidget {
  const ExibirValorPage({super.key});

  @override
  _ExibirValorPageState createState() => _ExibirValorPageState();
}

class _ExibirValorPageState extends State<ExibirValorPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarCabecalho(size: size),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double fontSize = constraints.maxWidth * 0.05;
          return Center(
            child: Container(
              width: constraints.maxWidth * 0.9, // Ajusta dinamicamente a largura
              padding: const EdgeInsets.all(16),
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child:  Text(
                        "10.000,00",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CancelarPage()),
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
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AnexaDocumentoPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: TextStyle(fontSize: fontSize * 0.9),
                        backgroundColor: const Color(0xFFFEB22D),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Contratar"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


