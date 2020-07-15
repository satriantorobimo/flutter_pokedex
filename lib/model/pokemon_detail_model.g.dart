// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetail _$PokemonDetailFromJson(Map<String, dynamic> json) {
  return PokemonDetail(
    abilities: (json['abilities'] as List)
        ?.map((e) =>
            e == null ? null : Abilities.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    base_experience: json['base_experience'] as int,
    forms: (json['forms'] as List)
        ?.map(
            (e) => e == null ? null : Forms.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    game_indices: (json['game_indices'] as List)
        ?.map((e) =>
            e == null ? null : GameIndicies.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    height: json['height'] as int,
    held_items: json['held_items'] as List,
    id: json['id'] as int,
    is_default: json['is_default'] as bool,
    location_area_encounters: json['location_area_encounters'] as String,
    moves: (json['moves'] as List)
        ?.map(
            (e) => e == null ? null : Moves.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    order: json['order'] as int,
    species: json['species'] == null
        ? null
        : Ability.fromJson(json['species'] as Map<String, dynamic>),
    sprites: json['sprites'] == null
        ? null
        : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
    stats: (json['stats'] as List)
        ?.map(
            (e) => e == null ? null : Stats.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    types: (json['types'] as List)
        ?.map(
            (e) => e == null ? null : Types.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    weight: json['weight'] as int,
  );
}

Map<String, dynamic> _$PokemonDetailToJson(PokemonDetail instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'base_experience': instance.base_experience,
      'forms': instance.forms,
      'game_indices': instance.game_indices,
      'height': instance.height,
      'held_items': instance.held_items,
      'id': instance.id,
      'is_default': instance.is_default,
      'location_area_encounters': instance.location_area_encounters,
      'moves': instance.moves,
      'name': instance.name,
      'order': instance.order,
      'species': instance.species,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
    };

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) {
  return Abilities(
    ability: json['ability'] == null
        ? null
        : Ability.fromJson(json['ability'] as Map<String, dynamic>),
    isHidden: json['isHidden'] as bool,
    slot: json['slot'] as int,
  );
}

Map<String, dynamic> _$AbilitiesToJson(Abilities instance) => <String, dynamic>{
      'ability': instance.ability,
      'isHidden': instance.isHidden,
      'slot': instance.slot,
    };

Forms _$FormsFromJson(Map<String, dynamic> json) {
  return Forms(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$FormsToJson(Forms instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) {
  return Ability(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

GameIndicies _$GameIndiciesFromJson(Map<String, dynamic> json) {
  return GameIndicies(
    gameIndex: json['gameIndex'] as int,
    version: json['version'] == null
        ? null
        : Ability.fromJson(json['version'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GameIndiciesToJson(GameIndicies instance) =>
    <String, dynamic>{
      'gameIndex': instance.gameIndex,
      'version': instance.version,
    };

Moves _$MovesFromJson(Map<String, dynamic> json) {
  return Moves(
    move: json['move'] == null
        ? null
        : Ability.fromJson(json['move'] as Map<String, dynamic>),
    version_group_details: (json['version_group_details'] as List)
        ?.map((e) => e == null
            ? null
            : VersionGroupDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovesToJson(Moves instance) => <String, dynamic>{
      'move': instance.move,
      'version_group_details': instance.version_group_details,
    };

VersionGroupDetails _$VersionGroupDetailsFromJson(Map<String, dynamic> json) {
  return VersionGroupDetails(
    level_learned_at: json['level_learned_at'] as int,
    move_learn_method: json['move_learn_method'] == null
        ? null
        : Ability.fromJson(json['move_learn_method'] as Map<String, dynamic>),
    version_group: json['version_group'] == null
        ? null
        : Ability.fromJson(json['version_group'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VersionGroupDetailsToJson(
        VersionGroupDetails instance) =>
    <String, dynamic>{
      'level_learned_at': instance.level_learned_at,
      'move_learn_method': instance.move_learn_method,
      'version_group': instance.version_group,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) {
  return Sprites(
    back_default: json['back_default'] as String,
    back_female: json['back_female'] as String,
    back_shiny: json['back_shiny'] as String,
    back_shinyFemale: json['back_shinyFemale'] as String,
    front_default: json['front_default'] as String,
    front_female: json['front_female'] as String,
    front_shiny: json['front_shiny'] as String,
    front_shinyFemale: json['front_shinyFemale'] as String,
  );
}

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'back_default': instance.back_default,
      'back_female': instance.back_female,
      'back_shiny': instance.back_shiny,
      'back_shinyFemale': instance.back_shinyFemale,
      'front_default': instance.front_default,
      'front_female': instance.front_female,
      'front_shiny': instance.front_shiny,
      'front_shinyFemale': instance.front_shinyFemale,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return Stats(
    base_stat: json['base_stat'] as int,
    effort: json['effort'] as int,
    stat: json['stat'] == null
        ? null
        : Ability.fromJson(json['stat'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'base_stat': instance.base_stat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

Types _$TypesFromJson(Map<String, dynamic> json) {
  return Types(
    slot: json['slot'] as int,
    type: json['type'] == null
        ? null
        : Ability.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
