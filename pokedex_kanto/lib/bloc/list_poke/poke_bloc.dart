import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_kanto/bloc/list_poke/poke_event.dart';
import 'package:pokedex_kanto/bloc/list_poke/poke_state.dart';
import 'package:pokedex_kanto/repository/poke_repo.dart';

class PokeBloc extends Bloc<PokeEvent, PokeState> {
  final PokeRepo pokeRepo;

  PokeBloc(this.pokeRepo) : super(PokeInitialState());

  @override
  Stream<PokeState> mapEventToState(PokeEvent event) async* {
    if (event is GetAllEvent) {
      yield PokeLoadingState();
      try {
        var listPokes = await pokeRepo.fetchData();

        yield PokeSuccessState(pokedex: listPokes);
      } catch (error) {
        print('Something went wrong: $error');
        yield PokeFailedState();
      }
    }
  }
}
