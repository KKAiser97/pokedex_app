import 'package:equatable/equatable.dart';
import 'package:pokedex_kanto/model/pokedex.dart';
import 'package:pokedex_kanto/model/pokemon.dart';

abstract class PokeState extends Equatable {
  @override
  List<Object> get props => [];
}

class PokeInitialState extends PokeState {}

class PokeLoadingState extends PokeState {}

class PokeSuccessState extends PokeState {
  final Pokedex pokedex;

  PokeSuccessState({required this.pokedex});

  @override
  List<Object> get props => [pokedex];
}

class PokeFailedState extends PokeState {}
