import 'package:flutter_tv_maze_jobsity/src/domain/entities/core/schedule_info_entity.dart';

class ScheduleInfoModel extends ScheduleInfoEntity {
  final String dtoTime;
  final List<String> dtoDays;

  ScheduleInfoModel({
    required this.dtoTime,
    required this.dtoDays,
  }) : super(
          time: dtoTime,
          days: dtoDays,
        );

  factory ScheduleInfoModel.fromMap(Map<String, dynamic> map) {
    final time = map['time'];
    final days = map['days'];

    return ScheduleInfoModel(
      dtoTime: (time ?? '').toString(),
      dtoDays: days != null
          ? (days as List).map((item) => item.toString()).toList()
          : const [],
    );
  }
}
