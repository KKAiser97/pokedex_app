import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_kanto/bloc/detail/detail_event.dart';
import 'package:pokedex_kanto/bloc/detail/detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState>{
  DetailBloc() : super(DetailLoadingState());

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is StartDetailEvent) {
      yield DetailLoadingState();
      add(GetDetailEvent(event.pokemon));
    }
    if (event is GetDetailEvent) {
      try {
        yield DetailFetchedState(event.pokemon);
      } catch (error) {
        print('Something went wrong: $error');
        yield DetailFailedState();
      }
    }
  }

}