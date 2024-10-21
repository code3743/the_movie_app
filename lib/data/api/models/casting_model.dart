import 'dart:convert';

import 'package:the_movie_app/domain/entites/cast.dart';

CastingModel castingModelFromJson(String str) =>
    CastingModel.fromJson(json.decode(str));

class CastingModel {
  int id;
  List<CastModel> cast;

  CastingModel({
    required this.id,
    required this.cast,
  });

  factory CastingModel.fromJson(Map<String, dynamic> json) => CastingModel(
        id: json["id"],
        cast: List<CastModel>.from(
            json["cast"].map((x) => CastModel.fromJson(x))),
      );

  List<Cast> toEntity() {
    return cast.map((e) => e.toEntity()).toList();
  }
}

class CastModel {
  int id;
  String name;

  String? profilePath;

  String? character;

  CastModel({
    required this.id,
    required this.name,
    required this.profilePath,
    this.character,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        id: json["id"],
        name: json["name"],
        profilePath: json["profile_path"],
        character: json["character"],
      );

  Cast toEntity() {
    return Cast(
      id: id.toString(),
      name: name,
      profileImage: profilePath ?? "",
      character: character ?? "",
    );
  }
}
