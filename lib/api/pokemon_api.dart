import 'package:flutter_pokedex/model/pokemon_detail_model.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';
import 'package:flutter_pokedex/util/network_util.dart';

class PokemonAPI {
  PokemonModel pokemonModel;
  PokemonDetail pokemonDetailModel;
  NetworkUtil netUtil = NetworkUtil();
  static final headerType = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Future<PokemonModel> fetchPokemon(int limit, int offset) async {
    return await netUtil
        .get('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset',
            headers: headerType)
        .then((dynamic res) {
      pokemonModel = PokemonModel.fromJson(res);
      return pokemonModel;
    });
  }

  Future<PokemonDetail> fetchDetailPokemon(String url) async {
    return await netUtil.get(url, headers: headerType).then((dynamic res) {
      pokemonDetailModel = PokemonDetail.fromJson(res);
      return pokemonDetailModel;
    });
  }
}
