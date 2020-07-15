import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';

abstract class PokemonState extends Equatable {
  PokemonState([List props = const []]) : super(props);
}

class PokemonEmpty extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<Results> pokemonList;
  final bool hasReachedMax;

  PokemonLoaded({
    this.pokemonList,
    this.hasReachedMax,
  });

  PokemonLoaded copyWith({
    List<Results> pokemonList,
    bool hasReachedMax,
  }) {
    return PokemonLoaded(
      pokemonList: pokemonList ?? this.pokemonList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [pokemonList, hasReachedMax];
}

class PokemonError extends PokemonState {
  String error;
  PokemonError(this.error) : assert(error != null);
}
