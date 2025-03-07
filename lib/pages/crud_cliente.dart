import 'package:flutter/material.dart';
import 'package:agillock_client_app/widgets/app_bar_cabecalho.dart';
import 'package:fetch_client/fetch_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:agillock_client_app/pages/exibir_valor.dart';


class CrudClientePage extends StatefulWidget {
  const CrudClientePage({super.key});

  @override
  _CrudClientePageState createState() => _CrudClientePageState();
}

class _CrudClientePageState extends State<CrudClientePage> {
  final _formKey = GlobalKey<FormState>();
  List<String> categorias = ['Carros', 'Caminhão', 'Moto'];
  String? selectedCategoria;
  List<String> marcas = [];
  String? selectedMarca;
  List<String> Modelos = [];
  String? selectedModelo;



  Future<void> _fetchMarcas(String value) async {
    final url = Uri.http('veiculos.fipe.org.br', 'api/veiculos/ConsultarMarcas');
    final client = FetchClient(mode: RequestMode.cors);
    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          //'Referer': 'http://veiculos.fipe.org.br',
          'Accept': '*/*'
        },
        body: jsonEncode({
          "codigoTabelaReferencia": 317,
          "codigoTipoVeiculo": 1
        }),

      );
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          marcas = data.map((e) => e['Label'].toString()).toList();
        });
      }
    }
    finally{
      client.close();
    }
  }

  Future<void> _fetchModelo(String value) async {
    final url = Uri.http('veiculos.fipe.org.br', 'api/veiculos/ConsultarMarcas');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Referer': 'http://veiculos.fipe.org.br'
      },
      body: jsonEncode({
        "codigoTabelaReferencia": 317,
        "codigoTipoVeiculo": value
      }),

    );
    if (response.statusCode == 200) {
      print('Chegou aqui');
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        Modelos = data.map((e) => e['Label'].toString()).toList();
      });
    }
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField("Nome"),
                  _buildTextField("CPF"),
                  _buildTextField("Telefone"),
                  _buildDropdown("Categoria", categorias, (value) {
                    setState(() {
                      selectedCategoria = value;
                      _fetchMarcas(value!);
                    });
                  }),
                  _buildDropdown("Marca", marcas, (value) {
                    setState(() {
                      selectedModelo = value;
                      _fetchModelo(value!);
                    });
                  }),
                  _buildDropdown("Modelo", Modelos, (value) {
                    setState(() {

                    });
                  }),
                  _buildTextField("Ano"),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Implementação da geração de cotação
                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExibirValorPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFEB22D),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text("Gerar cotação"),
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

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        validator: (value) => value!.isEmpty ? "$label é obrigatório" : null,
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> options, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        value: options.isNotEmpty ? options.first : null,
        items: options.map((option) {
          return DropdownMenuItem(value: option, child: Text(option));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}