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
          title: const Text('AgilLock'),
        ),
        body: Center(
            child: Container(
              width: 400,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(height: 32,),
                  ElevatedButton(
                    onPressed: (){


                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Entrar'),
                  ),
                ],
              ),

            )
        )

    );
  }
}