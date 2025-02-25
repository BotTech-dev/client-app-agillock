import 'package:flutter/material.dart';
import 'package:agillock_client_app/widgets/app_bar_cabecalho.dart';
import 'package:agillock_client_app/pages/crud_cliente.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({super.key});

  @override
  _InicialPageState createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
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
                        "Simule seu seguro em poucos passos!",
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
                            MaterialPageRoute(builder: (context) => CrudClientePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: TextStyle(fontSize: fontSize * 0.9),
                        backgroundColor: const Color(0xFFFEB22D),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Vamos lá"),
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


