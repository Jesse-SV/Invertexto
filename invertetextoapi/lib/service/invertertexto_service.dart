import 'dart:convert';

import 'package:http/http.dart' as http;

final String _token = "15476|lsZKVsgzCJTuEZuH95O1brKzfp1ehGwJ";

Future<Map> converteNumeroPorExtenso(String? _valor) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/number-to-words?token=$_token&number=$_valor&language=pt&currency=BRL"));
  return json.decode(response.body);
} 

Future<Map> buscaCep(String? _valor) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/cep/$_valor?token=$_token"));
  return json.decode(response.body);
} 

Future<Map> validaCPF(String? _valor) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/validator?token=$_token&value=$_valor"));
  return json.decode(response.body);
}