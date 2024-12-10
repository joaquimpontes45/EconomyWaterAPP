import 'package:flutter/material.dart';
import 'package:EconomyWater/widgets/CampoTexto.dart';
import 'package:EconomyWater/controller/conexao_api.dart';
import 'package:EconomyWater/view/tela_principal.dart';
import 'package:EconomyWater/widgets/imagem_fundo.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController identificadorController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Center(child: Text("Entrar", style: TextStyle(color: Colors.amber))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: Colors.black, thickness: 1.0),
        ),
      ),
      body: Stack(
        children: [
          const Imagem_fundo(),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Image.asset('assets/logo_economy_SemFundo.png', height: 200),
                  const SizedBox(height: 50),
                  CampoDeTexto(
                    controller: identificadorController,
                    label: 'Email ou nome de usuário',
                    icon: Icons.account_circle_rounded,
                  ),
                  const SizedBox(height: 20),
                  CampoDeTexto(
                    controller: senhaController,
                    label: 'Senha',
                    icon: Icons.security,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final apiService = ServicosApi();
                      final identificador = identificadorController.text.trim();
                      final senha = senhaController.text.trim();

                      if (identificador.isEmpty || senha.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Preencha todos os campos')));
                        return;
                      }

                      final response = await apiService.loginUsuario(identificador, senha);

                      if (response.containsKey('error')) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response['error'])));
                      } else {
                        final String nomeUsuario = response['usuario'] ?? identificador;
                        final String emailUsuario = response['email'] ?? 'Email não disponível';

                        Navigator.pushNamed(
                          context,
                          '/tela_principal',
                          arguments: {'nome': nomeUsuario, 'email': emailUsuario},
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
