import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:EconomyWater/controller/formulario_user.dart';
import 'package:EconomyWater/widgets/imagem_fundo.dart';
import '../controller/conexao_api.dart';
import 'cadastrar_userPartes/formulario_cadastro.dart';

class CadastrarUser extends StatelessWidget {
  final UsuarioFormController usuarioController = UsuarioFormController();

  CadastrarUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: topoDaTela(),
      body: Stack(
        children: [
          const Imagem_fundo(),
          SingleChildScrollView(
            child: Center(
              child: FormularioDeCadastro(
                  usuarioController: usuarioController, formCadastro: this),
            ),
          ),
        ],
      ),
    );
  }

  AppBar topoDaTela() {
    return AppBar(
      title: const Text(
        "Cadastrar Usuário",
        style: TextStyle(color: Colors.amber),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.black,
          height: 1.0,
        ),
      ),
    );
  }
}
