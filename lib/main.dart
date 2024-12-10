import 'package:flutter/material.dart';
import 'view/login_page.dart';
import 'view/tela_principal.dart';
import 'view/cadastrar_user.dart';


void main() => runApp(const MyApp()); 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/cadastro': (context) => CadastrarUser(),
        //'/tela_principal': (context) => const Tela_principal(nome: 'joaquim',email: 'joaquimpontes45@outlook.com',),
      },

      onGenerateRoute: (settings) {
        if (settings.name == '/tela_principal') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) {
              return Tela_principal(
                nome: args['nome'] ?? '',
                email: args['email'] ?? '',
              );
            },
          );
        }
      },//onGenerateRoute
    );
  }
}
