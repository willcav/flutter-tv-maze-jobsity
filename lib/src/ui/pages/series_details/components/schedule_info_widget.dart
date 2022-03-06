import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/schedule_info_entity.dart';

class ScheduleInfoWidget extends StatelessWidget {
  final ScheduleInfoEntity schedule;
  const ScheduleInfoWidget({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (schedule.time.isEmpty || schedule.time.isEmpty) {
      return Text(
        'No Schedule Information',
        style: Theme.of(context).textTheme.subtitle1,
      );
    }
    return Text.rich(
      TextSpan(
        style: Theme.of(context).textTheme.subtitle1,
        children: [
          TextSpan(text: schedule.time),
          const TextSpan(
            text: '  ·  ',
          ),
          ...schedule.days
              .map(
                (item) => TextSpan(
                  text: item,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
