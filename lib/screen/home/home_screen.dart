import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon/pokemon_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon/pokemon_event.dart';
import 'package:flutter_pokedex/bloc/pokemon/pokemon_state.dart';
import 'package:flutter_pokedex/repo/pokemon_repo.dart';
import 'package:flutter_pokedex/screen/home/bottom_loader_widget.dart';
import 'package:flutter_pokedex/screen/home/pokemon_list_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();
  final scrollThreshold = 200.0;
  PokemonBloc pokemonBloc = PokemonBloc(pokemonRepository: PokemonRepository());
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    pokemonBloc.add(FetchDataPokemon());
    scrollController.addListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        centerTitle: true,
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        bloc: pokemonBloc,
        builder: (_, PokemonState state) {
          if (state is PokemonEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PokemonError) {
            return Center(
              child: Text('Failed to fetch Pokemon'),
            );
          }
          if (state is PokemonLoaded) {
            if (state.pokemonList.isEmpty) {
              return Center(
                child: Text('no Pokemon'),
              );
            }

            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.pokemonList.length
                    ? BottomLoader()
                    : PokemonListWidget(
                        resultsPokemon: state.pokemonList[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.pokemonList.length
                  : state.pokemonList.length + 1,
              controller: scrollController,
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      pokemonBloc.add(FetchDataPokemon());
    }
  }
}
