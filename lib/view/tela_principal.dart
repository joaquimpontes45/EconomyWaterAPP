import 'package:EconomyWater/widgets/NavegacaoInferior.dart';
import 'package:EconomyWater/widgets/drawer.dart';
import 'package:EconomyWater/widgets/imagem_fundo.dart';
import 'package:flutter/material.dart';
import '../controller/conexao_api.dart';
import 'dart:convert';
import 'package:EconomyWater/widgets/Cards.dart';

class Tela_principal extends StatefulWidget {
  const Tela_principal({super.key, required this.nome, required this.email});
  final String nome;
  final String email;

  @override
  State<Tela_principal> createState() => Tela_principalState();
}

class Tela_principalState extends State<Tela_principal> {
  int statusBomba = 0;
  double temperaturaSolo = 0.0;
  double umidadeSolo = 0.0;
  final ServicosApi APIservicos = ServicosApi();
  late String inicialNome;
  final Cards cardsWidget = const Cards(); 

  @override
  void initState() {
    super.initState();
    inicialNome = widget.nome[0].toUpperCase();
    carregarDados();
  }

  Future<void> carregarDados() async {
    try {
      final response = await APIservicos.getStatusBomba();
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          statusBomba = data['status_bomba'] == 1 ? 1 : 0;
          temperaturaSolo = data['temperatura_solo'];
          umidadeSolo = data['umidade_solo'];
        });
      } else {
        Mensagem('Erro ao carregar dados');
      }
    } catch (e) {
      print(e);
      Mensagem('Erro ao carregar dados');
    }
  }

  void Mensagem(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  Future<void> alterarStatusBomba() async {
    int novoStatus = statusBomba == 0 ? 1 : 0;
    final response = await APIservicos.alterarStatusBomba(novoStatus);
    if (response.statusCode == 200) {
      setState(() {
        statusBomba = novoStatus;
      });
      //Mensagem('Status da bomba alterado');
    } else {
      Mensagem('Erro para alterar o status da bomba');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Imagem_fundo(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: cardsWidget.cardTemperatura(
                        "Temperatura: ${temperaturaSolo.toStringAsFixed(1)}°C",
                        Icons.thermostat,
                        Colors.orange,
                        () {},
                      ),
                    ),
                    Expanded(
                      child: cardsWidget.cardUmidade(
                        "Umidade: ${umidadeSolo.toStringAsFixed(1)}%",
                        Icons.water_drop,
                        Colors.blue,
                        () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ElevatedButton(
                      onPressed: alterarStatusBomba,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            statusBomba == 0 ? Colors.green : Colors.red,
                        padding: const EdgeInsets.all(20),
                      ),
                      child: const Icon(
                        Icons.power_settings_new,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      endDrawer: Gaveta(
        nome: widget.nome,
        email: widget.email,
        inicialNome: inicialNome,
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
