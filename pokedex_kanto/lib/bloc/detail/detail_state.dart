import 'package:equatable/equatable.dart';
import 'package:pokedex_kanto/model/pokemon.dart';

class DetailState extends Equatable{
  @override
  List<Object?> get props => [];

}
// class DetailInitialState extends DetailState{}

class DetailLoadingState extends DetailState{}

class DetailFetchedState extends DetailState{
  final Pokemon _pokemon;

  DetailFetchedState(this._pokemon);

  @override
  List<Object?> get props => [_pokemon];
}

class DetailFailedState extends DetailState{}