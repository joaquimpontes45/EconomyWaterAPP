import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicosApi {
  final String BaseDaUrl = 'http://10.0.0.9:5000';//'https://ecowater.etegaranhuns.com.br';

  Future<http.Response> cadastrar_usuario({
    required String nome,
    required String email,
    required String senha,
  }) async {
    final String apiUrl = '$BaseDaUrl/registro';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'nome': nome,
        'email': email,
        'senha': senha,
      }),
    );

    return response;
  }


  Future<http.Response> alterarStatusBomba(int status) async {
    final String apiUrl = '$BaseDaUrl/bomba';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'status': status}),
    );

    return response;
  }

  Future<http.Response> getStatusBomba() async {
    final String apiUrl = '$BaseDaUrl/dados';

    final response = await http.get(Uri.parse(apiUrl));

    return response;
  }



  Future<Map<String, dynamic>> loginUsuario(String identificador, String senha) async {
    final String apiUrl = '$BaseDaUrl/login';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'identificador': identificador,
        'senha': senha,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return {'error': json.decode(response.body)['error'] ?? 'Erro ao fazer login.'};
    }
  }

  //tela_umidade.dart
  Future<Map<String, dynamic>> getStatusSensores() async {
    final String apiUrl = '$BaseDaUrl/status_sensores';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }
}