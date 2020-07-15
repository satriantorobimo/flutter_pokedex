import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon_detail/bloc.dart';
import 'package:flutter_pokedex/model/pokemon_detail_model.dart';
import 'package:flutter_pokedex/repo/pokemon_detail_repo.dart';
import 'package:flutter_pokedex/screen/detail/detail_screen_widget.dart';

class PokemonDetailScreen extends StatefulWidget {
  final String url;

  const PokemonDetailScreen({Key key, this.url}) : super(key: key);
  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  PokemondetailBloc pokemondetailBloc =
      PokemondetailBloc(pokemonDetailRepository: PokemonDetailRepository());

  @override
  void initState() {
    pokemondetailBloc.add(FetchDataDetailPokemon(url: widget.url));
    super.initState();
  }

  @override
  void dispose() {
    pokemondetailBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex Detail'),
        centerTitle: true,
      ),
      body: BlocBuilder<PokemondetailBloc, PokemondetailState>(
        bloc: pokemondetailBloc,
        builder: (_, PokemondetailState state) {
          if (state is PokemonDetailEmpty) {
            return Container();
          }
          if (state is PokemonDetailLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PokemonDetailError) {
            return Center(
              child: Text('Failed to fetch Pokemon'),
            );
          }
          if (state is PokemonDetailLoaded) {
            return DetailScreenWidget(
              pokemonDetail: state.pokemonDetailList,
            );
          }
          return Container();
        },
      ),
    );
  }
}
