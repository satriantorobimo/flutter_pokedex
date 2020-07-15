import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PokemondetailEvent extends Equatable {
  PokemondetailEvent();
}

class FetchDataDetailPokemon extends PokemondetailEvent {
  FetchDataDetailPokemon({this.url});
  final String url;
}
