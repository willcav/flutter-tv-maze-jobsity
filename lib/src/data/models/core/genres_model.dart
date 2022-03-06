import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/genres_entity.dart';

class GenresModel extends GenresEntity {
  final List<String> dtoGenres;

  GenresModel({
    required this.dtoGenres,
  }) : super(genres: dtoGenres);

  factory GenresModel.fromMap(Map<String, dynamic> map) {
    final genres = map['genres'];

    if (genres == null) {
      return GenresModel(dtoGenres: const []);
    }

    final list = (genres as List)
        .map(
          (item) => item.toString(),
        )
        .toList();

    return GenresModel(dtoGenres: list);
  }
}
