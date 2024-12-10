import 'package:flutter/material.dart';

class Gaveta extends StatelessWidget {
  final String nome;
  final String email;
  final String inicialNome;

  const Gaveta({
    Key? key,
    required this.nome,
    required this.email,
    required this.inicialNome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagem_fundo'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [

            UserAccountsDrawerHeader(
              accountName: Text(nome.split(' ')[0]),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  inicialNome,
                  style: const TextStyle(fontSize: 40.0, color: Colors.blue),
                ),
              ),
            ),


            const Spacer(),

            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.white),
              title: const Text("Sair", style: TextStyle(color: Colors.white)),
              subtitle: const Text('Voltar para tela de login',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Sair'),
                      content: const Text('Tem certeza que deseja sair?'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Sair'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.popUntil(
                                context,
                                ModalRoute.withName('/'));
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
