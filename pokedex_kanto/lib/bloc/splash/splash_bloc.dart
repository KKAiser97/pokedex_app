import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_kanto/bloc/splash/splash_event.dart';
import 'package:pokedex_kanto/bloc/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(ShowSplashState());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is GetSplashEvent) {
      await Future.delayed(Duration(seconds: 3), () async {
        add(NavigateNotifyEvent());
      });
    } else if (event is NavigateNotifyEvent) {
      yield NavigatingState();
    }
  }
}
