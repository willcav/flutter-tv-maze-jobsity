import 'package:flutter/material.dart';

import '../../../../domain/entities/get_series_details/series_detailed_info_entity.dart';
import 'genres_info_widget.dart';
import 'schedule_info_widget.dart';
import 'series_status_widget.dart';

import '../../shared/components/summary_widget.dart';

class SeriesDetailsContent extends StatelessWidget {
  final SeriesDetailedInfoEntity seriesDetails;
  const SeriesDetailsContent({Key? key, required this.seriesDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            seriesDetails.name,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 8,
          ),
          GenresInfoWidget(genres: seriesDetails.genres),
          const SizedBox(
            height: 8,
          ),
          SummaryWidget(text: seriesDetails.summary),
          const SizedBox(
            height: 8,
          ),
          SeriesStatusWidget(status: seriesDetails.status),
          const SizedBox(
            height: 8,
          ),
          ScheduleInfoWidget(schedule: seriesDetails.schedule),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
