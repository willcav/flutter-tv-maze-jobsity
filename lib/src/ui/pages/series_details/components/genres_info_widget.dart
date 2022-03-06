import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/genres_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_colors.dart';

class GenresInfoWidget extends StatelessWidget {
  final GenresEntity genres;
  const GenresInfoWidget({
    Key? key,
    required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (genres.genres.isEmpty) {
      return const SizedBox();
    }

    return Wrap(
        children: genres.genres.map((item) => buildGenreItem(item)).toList());
  }

  Widget buildGenreItem(String name) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: Text(name),
    );
  }
}
