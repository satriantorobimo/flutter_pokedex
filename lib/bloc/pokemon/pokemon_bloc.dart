import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(
    PokemonEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
