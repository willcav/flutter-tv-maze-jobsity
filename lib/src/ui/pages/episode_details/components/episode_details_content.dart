import 'package:flutter/material.dart';
import '../../../../domain/entities/core/episode_entity.dart';
import 'episode_number_info_widget.dart';

import '../../shared/components/summary_widget.dart';

class EpisodeDetailsContent extends StatelessWidget {
  final EpisodeEntity episode;
  const EpisodeDetailsContent({Key? key, required this.episode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            episode.name,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 8,
          ),
          EpisodeNumberInfoWidget(
              number: episode.number, season: episode.seasonNumber),
          const SizedBox(
            height: 24,
          ),
          SummaryWidget(text: episode.summary),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
