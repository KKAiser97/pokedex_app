import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_kanto/bloc/bloc_observer.dart';
import 'package:pokedex_kanto/repository/poke_repo.dart';
import 'package:pokedex_kanto/screen/detail_screen.dart';
import 'package:pokedex_kanto/screen/splash_screen.dart';

import 'bloc/poke_bloc.dart';
import 'datasource/poke_data.dart';
import 'screen/home_screen.dart';

void main() {
  Bloc.observer = PokeBlocObserver();
  final pokedata = Pokedata();
  final pokeRepo = PokeRepo(pokedata: pokedata);
  runApp(MyApp(
    pokeRepo: pokeRepo,
  ));
}

class MyApp extends StatelessWidget {
  final PokeRepo pokeRepo;

  const MyApp({Key? key, required this.pokeRepo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.id,
      home: BlocProvider<PokeBloc>(
        create: (BuildContext context) => PokeBloc(pokeRepo),
        child: MyHomePage(),
        //TODO: pass bloc to SplashScreen
      ),
    );
  }
}
