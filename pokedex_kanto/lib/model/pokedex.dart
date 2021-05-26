import 'package:equatable/equatable.dart';
import 'package:pokedex_kanto/model/pokemon.dart';

class Pokedex extends Equatable {
  late final List<Pokemon> pokemon;

  Pokedex({required this.pokemon});

  Pokedex.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = <Pokemon>[];
      json['pokemon'].cast<Pokemon>().forEach((v) {
        pokemon.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pokemon'] = this.pokemon.map((v) => v.toJson()).toList();

    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [pokemon];
}
