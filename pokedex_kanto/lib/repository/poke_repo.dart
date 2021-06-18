import 'package:pokedex_kanto/datasource/poke_data.dart';
import 'package:pokedex_kanto/model/pokedex.dart';

class PokeRepo {
  final Pokedata pokedata;

  PokeRepo({required this.pokedata});

  @override
  Future<Pokedex> fetchData () async => await pokedata.fetchData();
  //TODO: catch exception here
}
