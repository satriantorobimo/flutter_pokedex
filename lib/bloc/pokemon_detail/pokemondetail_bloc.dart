import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokemon_detail_model.dart';
import 'package:flutter_pokedex/repo/pokemon_detail_repo.dart';
import './bloc.dart';

class PokemondetailBloc extends Bloc<PokemondetailEvent, PokemondetailState> {
  PokemondetailBloc({@required this.pokemonDetailRepository})
      : assert(pokemonDetailRepository != null);
  final PokemonDetailRepository pokemonDetailRepository;
  PokemonDetail pokemonDetailModel;

  @override
  Stream<PokemondetailState> mapEventToState(
    PokemondetailEvent event,
  ) async* {
    if (event is FetchDataDetailPokemon) {
      yield PokemonDetailLoading();
      try {
        pokemonDetailModel =
            await pokemonDetailRepository.getDetailPokemon(event.url);
        yield PokemonDetailLoaded(pokemonDetailList: pokemonDetailModel);
      } catch (e) {
        yield PokemonDetailError(e.toString());
      }
    }
  }

  @override
  PokemondetailState get initialState => PokemonDetailEmpty();
}
