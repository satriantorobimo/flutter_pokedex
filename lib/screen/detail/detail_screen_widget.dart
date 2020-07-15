import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokemon_detail_model.dart';

class DetailScreenWidget extends StatelessWidget {
  final PokemonDetail pokemonDetail;

  const DetailScreenWidget({Key key, this.pokemonDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          Center(
            child: Text(pokemonDetail.name ?? '',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
              width: 100,
              height: 100,
              child: Image.network(pokemonDetail.sprites.front_default)),
          SizedBox(height: 16),
          Container(
              child:
                  Text('Stats', style: TextStyle(fontWeight: FontWeight.bold))),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(pokemonDetail.stats[index].stat.name),
                  subtitle:
                      Text(pokemonDetail.stats[index].base_stat.toString()),
                  dense: true,
                );
              },
              itemCount: pokemonDetail.stats.length,
            ),
          ),
          SizedBox(height: 16),
          Container(
              child: Text('Abilities',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(pokemonDetail.abilities[index].ability.name),
                  subtitle:
                      Text(pokemonDetail.abilities[index].slot.toString()),
                  dense: true,
                );
              },
              itemCount: pokemonDetail.abilities.length,
            ),
          ),
          SizedBox(height: 16),
          Container(
              child:
                  Text('Moves', style: TextStyle(fontWeight: FontWeight.bold))),
          Container(
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: pokemonDetail.moves.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5.0,
                    child: Container(
                      alignment: Alignment.center,
                      child: Center(
                          child: Text(pokemonDetail.moves[index].move.name)),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
