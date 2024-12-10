import 'package:flutter/material.dart';

class CampoDeTexto extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final bool obscureText;

  const CampoDeTexto({
    super.key,
    required this.controller,
    required this.label,
    this.icon,  // Ícone opcional
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        prefixIcon: icon != null ? Icon(icon) : null,  // Exibe o ícone se for fornecido
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
