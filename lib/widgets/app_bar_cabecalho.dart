import 'package:flutter/material.dart';


class AppBarCabecalho extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCabecalho({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(size.height * 0.25);
}