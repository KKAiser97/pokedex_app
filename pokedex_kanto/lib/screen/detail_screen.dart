import 'package:flutter/material.dart';
import 'package:pokedex_kanto/model/pokemon.dart';

class PokeDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokeDetailScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemon Detail'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(pokemon.name),
              Image.network(pokemon.img),
              Text(pokemon.number),
              Text(pokemon.height),
              Text(pokemon.weight),
              //TODO: continue
            ],
          ),
        ));
  }
}
