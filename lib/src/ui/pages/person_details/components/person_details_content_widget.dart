import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/person_details/components/person_dates_info_widget.dart';

import '../../../../domain/entities/search_people/person_basic_info_entity.dart';

class PersonDetailsContentWidget extends StatelessWidget {
  final PersonBasicInfoEntity personInfo;
  const PersonDetailsContentWidget({
    Key? key,
    required this.personInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            personInfo.name,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 8,
          ),
          PersonDatesInfoWidget(
            birthday: personInfo.birthday,
            deathday: personInfo.deathday,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
