import 'package:flutter/material.dart';

class UsuarioFormController {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController repetirSenhaController = TextEditingController();

  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    repetirSenhaController.dispose();
  }
}
