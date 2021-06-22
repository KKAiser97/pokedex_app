import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_kanto/bloc/list_poke/poke_bloc.dart';
import 'package:pokedex_kanto/bloc/splash/splash_bloc.dart';
import 'package:pokedex_kanto/bloc/splash/splash_event.dart';
import 'package:pokedex_kanto/bloc/splash/splash_state.dart';
import 'package:pokedex_kanto/repository/poke_repo.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const id = 'splash_screen';
  final PokeRepo pokeRepo;

  const SplashScreen(this.pokeRepo);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      builder: (context, state) {
        if (state is ShowSplashState) {
          BlocProvider.of<SplashBloc>(context).add(GetSplashEvent());
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                        'assets/images/pokemon-go-new-loading-screen.jpg'))),
          );
        }
        return CircularProgressIndicator();
      },
      listener: (context, state) {
        if (state is NavigatingState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider<PokeBloc>(
                      create: (BuildContext context) => PokeBloc(pokeRepo),
                      child: MyHomePage(),
                    )),
          );
        }
      },
    );
  }
}
