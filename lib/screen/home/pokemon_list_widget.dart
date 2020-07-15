import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';
import 'package:flutter_pokedex/screen/detail/detail_screen.dart';

class PokemonListWidget extends StatelessWidget {
  final Results resultsPokemon;

  const PokemonListWidget({Key key, @required this.resultsPokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: GestureDetector(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PokemonDetailScreen(url: resultsPokemon.url)),
              ),
          child: Icon(Icons.arrow_forward_ios)),
      title: Text(resultsPokemon.name),
      dense: true,
    );
  }
}
