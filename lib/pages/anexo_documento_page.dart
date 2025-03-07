import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:agillock_client_app/widgets/app_bar_cabecalho.dart';
import 'dart:io';
import 'package:agillock_client_app/pages/anexo_imagem_carro_page.dart';
import 'package:agillock_client_app/pages/cancelar_page.dart';

class AnexaDocumentoPage extends StatefulWidget {
  const AnexaDocumentoPage({super.key});

  @override
  _AnexaDocumentoPageState createState() => _AnexaDocumentoPageState();
}

class _AnexaDocumentoPageState extends State<AnexaDocumentoPage> {
  final List<File> _documentos = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickDocument() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _documentos.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _capturePhoto() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _documentos.add(File(pickedFile.path));
      });
    }
  }

  void _removeDocument(int index) {
    setState(() {
      _documentos.removeAt(index);
    });
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.upload_file, color: Colors.white),
                        onPressed: _pickDocument,
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.white),
                        onPressed: _capturePhoto,
                      ),
                      const Text(
                        "Anexar documento ou tirar foto",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _documentos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Text("Documento ${index + 1}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removeDocument(index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
                      backgroundColor: const Color(0xFFFE492D),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text("Cancelar"),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnexaImageVeiculoPage()),
                      );
                    }, // Implementar envio dos documentos
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFEB22D),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
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
