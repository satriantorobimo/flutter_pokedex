import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/api/pokemon_api.dart';
import 'package:flutter_pokedex/bloc/pokemon/pokemon_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon/pokemon_event.dart';
import 'package:flutter_pokedex/bloc/pokemon/pokemon_state.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';
import 'package:flutter_pokedex/repo/pokemon_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_data.dart';

class MockApi extends Mock implements PokemonAPI {}

class MockRepo extends Mock implements PokemonRepository {}

BuildContext context;

main() {
  PokemonRepository repoPokemnon;
  PokemonModel mockPokemonListModelData;
  // ignore: close_sinks
  PokemonBloc pokemonBloc;

  setUp(() {
    repoPokemnon = MockRepo();
    pokemonBloc = PokemonBloc(pokemonRepository: repoPokemnon);

    //mockdata
    PokemonModel result = PokemonModel();
    dynamic responseJson = json.decode(MockJsonString.responsePokemonList);
    result = PokemonModel.fromJson(responseJson);
    mockPokemonListModelData = result;
  });

  test('Test Initial State', () {
    expect(pokemonBloc.initialState, PokemonEmpty());
  });

  group('Pokemon Bloc Get Data', () {
    test('Fetch Pokemon List Success', () async {
      when(repoPokemnon.getPokemon(20, 0))
          .thenAnswer((_) async => Future.value(mockPokemonListModelData));
      expectLater(
          pokemonBloc.state,
          emitsInOrder([
            PokemonEmpty(),
            PokemonLoading(),
            PokemonLoaded(pokemonList: mockPokemonListModelData.results)
          ]));

      pokemonBloc.add(FetchDataPokemon());
    });
  });
}
