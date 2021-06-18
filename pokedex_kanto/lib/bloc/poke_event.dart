import 'package:equatable/equatable.dart';

abstract class PokeEvent extends Equatable {
  const PokeEvent();

  @override
  List<Object> get props => [];
}

class GetAllEvent extends PokeEvent {}
