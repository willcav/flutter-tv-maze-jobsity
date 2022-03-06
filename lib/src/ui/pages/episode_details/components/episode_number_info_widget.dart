import 'package:flutter/material.dart';

class EpisodeNumberInfoWidget extends StatelessWidget {
  final String number;
  final String season;
  const EpisodeNumberInfoWidget({
    Key? key,
    required this.number,
    required this.season,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: Theme.of(context).textTheme.headline3,
        children: [
          TextSpan(text: 'Season $season'),
          const TextSpan(
            text: '  ·  ',
          ),
          TextSpan(text: 'Episode $number'),
        ],
      ),
    );
  }
}
