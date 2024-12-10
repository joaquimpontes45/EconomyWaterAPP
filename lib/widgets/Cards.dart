import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  Widget cardUmidade(
      String titulo, IconData icone, Color cor, VoidCallback onClick) {
    return Card(
      color: cor.withOpacity(0.5),
      margin: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: onClick,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icone, color: cor, size: 40),
              const SizedBox(height: 10),
              Text(titulo,
                  style: const TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardTemperatura(
      String titulo, IconData icone, Color cor, VoidCallback onClick) {
    return Card(
      color: cor.withOpacity(0.5),
      margin: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: onClick,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icone, color: cor, size: 40),
              const SizedBox(height: 10),
              Text(titulo,
                  style: const TextStyle(fontSize: 13, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
