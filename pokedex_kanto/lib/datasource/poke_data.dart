import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_kanto/config/string.dart';
import 'package:pokedex_kanto/model/pokedex.dart';

class Pokedata {
  Future<Pokedex> fetchData() async {
    final Pokedex pokedex;
    String url = URL;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      var decodedJson = jsonDecode(response.body);
      print('+======ssssss=$decodedJson');
      pokedex = Pokedex.fromJson(decodedJson);
      print('+=======$pokedex');
      return pokedex;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}
