import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_kanto/event/poke_event.dart';
import 'package:pokedex_kanto/repository/poke_repo.dart';
import 'package:pokedex_kanto/state/poke_state.dart';

class PokeBloc extends Bloc<PokeEvent, PokeState> {
  final PokeRepo pokeRepo;

  PokeBloc(this.pokeRepo) : super(PokeInitialState());

  @override
  Stream<PokeState> mapEventToState(PokeEvent event) async* {
    if (event is GetAllEvent) {
      yield PokeLoadingState();
      try {

        var listPokes = await pokeRepo.fetchData();
        if(listPokes != null)
          {
            yield PokeSuccessState(pokedex: listPokes);
          }
        else
          {
            yield PokeFailedState();
          }

      } catch (error) {
        print('Something went wrong: $error');
        yield PokeFailedState();
      }
    }
  }
}
