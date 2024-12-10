import 'package:flutter/material.dart';

class Imagem_fundo extends StatelessWidget {
  const Imagem_fundo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/imagem_fundo'
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}