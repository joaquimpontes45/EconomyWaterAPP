import 'dart:convert';

import 'package:EconomyWater/controller/formulario_user.dart';
import 'package:EconomyWater/view/cadastrar_user.dart';
import 'package:EconomyWater/widgets/CampoTexto.dart';
import 'package:flutter/material.dart';
import '../../controller/conexao_api.dart'; // Importa a classe ServicosApi

class FormularioDeCadastro extends StatelessWidget {
  final UsuarioFormController usuarioController;
  final CadastrarUser formCadastro;

  FormularioDeCadastro({super.key, required this.usuarioController, required this.formCadastro});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 100),
            CampoDeTexto(
              controller: usuarioController.nomeController,
              label: 'Nome',
            ),
            const SizedBox(height: 16),
            CampoDeTexto(
              controller: usuarioController.emailController,
              label: 'E-mail',
            ),
            const SizedBox(height: 16),
            CampoDeTexto(
              controller: usuarioController.senhaController,
              label: 'Senha',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CampoDeTexto(
              controller: usuarioController.repetirSenhaController,
              label: 'Repetir Senha',
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                // Lógica para validar e cadastrar o usuário
                if (usuarioController.nomeController.text.isEmpty ||
                    usuarioController.emailController.text.isEmpty ||
                    usuarioController.senhaController.text.isEmpty ||
                    usuarioController.repetirSenhaController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Preencha todos os campos"))
                  );
                } else if (usuarioController.senhaController.text != usuarioController.repetirSenhaController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("As senhas não coincidem"))
                  );
                } else {
                  // Usando a classe ServicosApi para cadastrar o usuário
                  final apiService = ServicosApi();
                  final response = await apiService.cadastrar_usuario(
                    nome: usuarioController.nomeController.text,
                    email: usuarioController.emailController.text,
                    senha: usuarioController.senhaController.text,
                  );

                  if (response.statusCode == 201) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Usuário cadastrado com sucesso"))
                    );
                    Navigator.pop(context); // Voltar para a tela anterior (geralmente login)
                  } else {
                    final error = json.decode(response.body)['error'] ?? 'Erro desconhecido';
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error))
                    );
                  }
                }
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
