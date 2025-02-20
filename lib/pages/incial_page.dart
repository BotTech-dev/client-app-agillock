import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({super.key});
  @override
  _InicialPageState createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 210,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFFEB22D), width: 4), // Borda amarela
                  borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                ),
                child: Image.asset(
                  'assets/images/logo.png', // Caminho da imagem na pasta assets
                  height: 200, // Ajustando o tamanho da imagem
                ),
              ),
              const SizedBox(width: 10),
              //const Text("Registrar Bebida"),
            ],
          ),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
              width: 500,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(height: 32,),
                  SizedBox(
                    width: double.infinity, // Faz o botão ocupar toda a largura
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16), // Aumenta a altura
                        textStyle: const TextStyle(fontSize: 18), // Aumenta o tamanho do texto
                        backgroundColor: const Color(0xFFFEB22D),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Salvar"),
                    ),
                  ),

                ],
              ),

            )
        )

    );
  }
}