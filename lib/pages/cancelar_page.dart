import 'package:flutter/material.dart';
import 'package:agillock_client_app/widgets/app_bar_cabecalho.dart';

class CancelarPage extends StatefulWidget {
  const CancelarPage({super.key});

  @override
  _CancelarPageState createState() => _CancelarPageState();
}

class _CancelarPageState extends State<CancelarPage> {
  final TextEditingController _motivoController = TextEditingController();
  bool _aceitaCompartilhar = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarCabecalho(size: size),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Por favor nos conte por que não quis contratar o seguro?",
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _motivoController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _aceitaCompartilhar,
                      onChanged: (value) {
                        setState(() {
                          _aceitaCompartilhar = value!;
                        });
                      },
                      activeColor: const Color(0xFFFEB22D),
                    ),
                    const Text(
                      "Aceita compartilhar os seus dados com a AgilLock",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFEB22D),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text("Sair"),
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
