import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';
import 'package:flutter_pokedex/repo/pokemon_repo.dart';

import 'pokemon_event.dart';
import 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc({@required this.pokemonRepository})
      : assert(pokemonRepository != null);
  final PokemonRepository pokemonRepository;
  PokemonModel pokemonModel;

  @override
  Stream<Transition<PokemonEvent, PokemonState>> transformEvents(
    Stream<PokemonEvent> events,
    TransitionFunction<PokemonEvent, PokemonState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 200)),
      transitionFn,
    );
  }

  @override
  PokemonState get initialState => PokemonEmpty();

  @override
  Stream<PokemonState> mapEventToState(
    PokemonEvent event,
  ) async* {
    final currentState = state;
    if (event is FetchDataPokemon && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PokemonEmpty) {
          pokemonModel = await pokemonRepository.getPokemon(15, 0);
          yield PokemonLoaded(
              pokemonList: pokemonModel.results, hasReachedMax: false);
        }
        if (currentState is PokemonLoaded) {
          pokemonModel = await pokemonRepository.getPokemon(
              15, currentState.pokemonList.length);
          yield pokemonModel.results.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PokemonLoaded(
                  pokemonList: currentState.pokemonList + pokemonModel.results,
                  hasReachedMax: false,
                );
        }
      } catch (e) {
        yield PokemonError(e.toString());
      }
    }
  }

  bool _hasReachedMax(PokemonState state) =>
      state is PokemonLoaded && state.hasReachedMax;
}
