import 'package:flutter_pokedex/api/pokemon_api.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';

class PokemonRepository {
  final PokemonAPI pokemonAPI = PokemonAPI();

  Future<PokemonModel> getPokemon(int limit, int offset) =>
      pokemonAPI.fetchPokemon(limit, offset);
}
