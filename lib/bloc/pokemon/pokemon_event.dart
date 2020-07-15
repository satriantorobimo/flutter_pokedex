import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  PokemonEvent([List props = const []]) : super(props);
}

class FetchDataPokemon extends PokemonEvent {
  FetchDataPokemon({this.limit, this.offset});
  final int limit;
  final int offset;
}
