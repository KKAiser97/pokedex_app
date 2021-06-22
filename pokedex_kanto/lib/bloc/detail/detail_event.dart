import 'package:equatable/equatable.dart';
import 'package:pokedex_kanto/model/pokemon.dart';

class DetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class StartDetailEvent extends DetailEvent{
  final Pokemon pokemon;

  StartDetailEvent(this.pokemon);

  @override
  List<Object?> get props => [pokemon];
}

class GetDetailEvent extends DetailEvent {
  final Pokemon pokemon;

  GetDetailEvent(this.pokemon);

  @override
  List<Object?> get props => [pokemon];
}
