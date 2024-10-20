import 'package:the_movie_app/domain/entites/genre.dart';

class GenreModel {
  int id;
  String name;

  GenreModel({
    required this.id,
    required this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Genre toEntity() {
    return Genre(
      id: id,
      name: name,
    );
  }
}
