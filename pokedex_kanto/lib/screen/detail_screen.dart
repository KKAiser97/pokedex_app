import 'package:flutter/material.dart';
import 'package:pokedex_kanto/model/pokemon.dart';
import 'package:pokedex_kanto/screen/widgets/type_filter_chip.dart';

class PokeDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokeDetailScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemon Detail'),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          heightFactor: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Image.network(pokemon.img),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                pokemon.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Card(
                color: Colors.cyan,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text('No: ' + pokemon.number),
                    Text('Height: ' + pokemon.height),
                    Text('Weight: ' + pokemon.weight),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      'Types',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.type.map((type) {
                        return TypeFilterChip(type: type);
                      }).toList(),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      'Weaknesses',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.weaknesses.map((type) {
                        return TypeFilterChip(type: type);
                      }).toList(),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      'Next Evolution',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    GestureDetector(
                      child: Column(
                        children: [
                          // Image.network(), TODO: add function to get img
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/rare-candy-transparent.png',
                              fit: BoxFit.scaleDown,
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.1,
                            ),
                            label: Text(
                              pokemon.nextEvolution[0].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
