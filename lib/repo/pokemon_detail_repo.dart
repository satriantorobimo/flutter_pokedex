import 'package:flutter_pokedex/api/pokemon_api.dart';
import 'package:flutter_pokedex/model/pokemon_detail_model.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';

class PokemonDetailRepository {
  final PokemonAPI pokemonAPI = PokemonAPI();

  Future<PokemonDetail> getDetailPokemon(String url) =>
      pokemonAPI.fetchDetailPokemon(url);
}
