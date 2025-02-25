import 'package:flutter/material.dart';
import 'package:agillock_client_app/widgets/app_bar_cabecalho.dart';


class CrudClientePage extends StatefulWidget {
  const CrudClientePage({super.key});

  @override
  _CrudClientePage createState() => _CrudClientePage();
}

class _CrudClientePage extends State<CrudClientePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarCabecalho(size: size),
      body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Container(),
            );

          },
      ),
    );
  }
}