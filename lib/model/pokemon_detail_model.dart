import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail_model.g.dart';

@JsonSerializable()
class PokemonDetail {
  List<Abilities> abilities;
  int base_experience;
  List<Forms> forms;
  List<GameIndicies> game_indices;
  int height;
  List<dynamic> held_items;
  int id;
  bool is_default;
  String location_area_encounters;
  List<Moves> moves;
  String name;
  int order;
  Ability species;
  Sprites sprites;
  List<Stats> stats;
  List<Types> types;
  int weight;

  PokemonDetail(
      {this.abilities,
      this.base_experience,
      this.forms,
      this.game_indices,
      this.height,
      this.held_items,
      this.id,
      this.is_default,
      this.location_area_encounters,
      this.moves,
      this.name,
      this.order,
      this.species,
      this.sprites,
      this.stats,
      this.types,
      this.weight});

  factory PokemonDetail.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailToJson(this);
}

@JsonSerializable()
class Abilities {
  Ability ability;
  bool isHidden;
  int slot;

  Abilities({this.ability, this.isHidden, this.slot});

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}

@JsonSerializable()
class Forms {
  String name;
  String url;

  Forms({this.name, this.url});

  factory Forms.fromJson(Map<String, dynamic> json) => _$FormsFromJson(json);

  Map<String, dynamic> toJson() => _$FormsToJson(this);
}

@JsonSerializable()
class Ability {
  String name;
  String url;

  Ability({this.name, this.url});

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class GameIndicies {
  int gameIndex;
  Ability version;

  GameIndicies({this.gameIndex, this.version});

  factory GameIndicies.fromJson(Map<String, dynamic> json) =>
      _$GameIndiciesFromJson(json);

  Map<String, dynamic> toJson() => _$GameIndiciesToJson(this);
}

@JsonSerializable()
class Moves {
  Ability move;
  List<VersionGroupDetails> version_group_details;

  Moves({this.move, this.version_group_details});

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);

  Map<String, dynamic> toJson() => _$MovesToJson(this);
}

@JsonSerializable()
class VersionGroupDetails {
  int level_learned_at;
  Ability move_learn_method;
  Ability version_group;

  VersionGroupDetails(
      {this.level_learned_at, this.move_learn_method, this.version_group});
  factory VersionGroupDetails.fromJson(Map<String, dynamic> json) =>
      _$VersionGroupDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGroupDetailsToJson(this);
}

@JsonSerializable()
class Sprites {
  String back_default;
  String back_female;
  String back_shiny;
  String back_shinyFemale;
  String front_default;
  String front_female;
  String front_shiny;
  String front_shinyFemale;

  Sprites(
      {this.back_default,
      this.back_female,
      this.back_shiny,
      this.back_shinyFemale,
      this.front_default,
      this.front_female,
      this.front_shiny,
      this.front_shinyFemale});
  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

@JsonSerializable()
class Stats {
  int base_stat;
  int effort;
  Ability stat;

  Stats({this.base_stat, this.effort, this.stat});

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}

@JsonSerializable()
class Types {
  int slot;
  Ability type;

  Types({this.slot, this.type});
  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}
