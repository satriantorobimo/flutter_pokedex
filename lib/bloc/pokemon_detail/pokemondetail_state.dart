import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokemon_detail_model.dart';

@immutable
abstract class PokemondetailState extends Equatable {
  PokemondetailState();
}

class PokemonDetailEmpty extends PokemondetailState {}

class PokemonDetailLoading extends PokemondetailState {}

class PokemonDetailLoaded extends PokemondetailState {
  final PokemonDetail pokemonDetailList;

  PokemonDetailLoaded({this.pokemonDetailList});
}

class PokemonDetailError extends PokemondetailState {
  String error;
  PokemonDetailError(this.error) : assert(error != null);
}
