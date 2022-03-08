import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_cast_credits/cast_credit_info_entity.dart';

import '../../../../domain/entities/get_all_series/series_basic_info_entity.dart';
import 'series_cast_credit_card.dart';

class CastCreditInfoWidget extends StatelessWidget {
  final List<CastCreditInfoEntity> castCreditList;
  final void Function({required SeriesBasicInfoEntity seriesEntity}) onTap;
  const CastCreditInfoWidget({
    Key? key,
    required this.castCreditList,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (castCreditList.isEmpty) {
      return const SizedBox();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Filmography',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        buildCastCreditsComponent(),
      ],
    );
  }

  Widget buildCastCreditsComponent() {
    return SizedBox(
      height: 350,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: castCreditList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16 : 0,
              right: index == castCreditList.length - 1 ? 16 : 0,
            ),
            child: SeriesCastCreditCard(
                index: index,
                seriesInfoItem: castCreditList[index].series,
                onTap: onTap,
                heroTag: 'person${castCreditList[index].series.id}'),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
}
