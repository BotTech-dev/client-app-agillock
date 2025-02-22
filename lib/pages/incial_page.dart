import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: size.height * 0.25, // Ajusta dinamicamente o tamanho da AppBar
        title: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFFEB22D), width: 4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              'assets/images/logo.png',
              height: size.height * 0.2, // Ajusta dinamicamente a altura da imagem
            ),
          ),
        ),
        centerTitle: true,
      ),
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
                      onPressed: () {},
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
