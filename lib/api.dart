import 'dart:convert';

import 'package:http/http.dart' as http;

getAPI() async {
  var url = Uri.parse('https://weather.contrateumdev.com.br/api/weather/city/?city=palhoca');
  var response = await http.get(url);
  if(response.statusCode == 200) {
    var data = await jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Falha na Requisição');
  }
}