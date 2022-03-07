import 'package:flutter/material.dart';

import '../../../../domain/entities/list_all_series/series_basic_info_entity.dart';
import '../../../themes/app_colors.dart';

import 'image_widget.dart';

class SeriesCard extends StatelessWidget {
  final int index;
  final SeriesBasicInfoEntity seriesInfoItem;
  final void Function({required SeriesBasicInfoEntity seriesEntity}) onTap;
  const SeriesCard({
    Key? key,
    required this.index,
    required this.seriesInfoItem,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: index == 0 || index == 1 ? 32 : 0),
      child: InkWell(
        onTap: () => onTap(seriesEntity: seriesInfoItem),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.grey1,
                ),
                child: Hero(
                  tag: '${seriesInfoItem.id}${seriesInfoItem.name}',
                  child: ImageWidget(
                    imageNetworkPath: seriesInfoItem.image.medium,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(seriesInfoItem.name,
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(
              height: 8,
            ),
            Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.subtitle1,
                children: [
                  TextSpan(text: seriesInfoItem.type),
                  const TextSpan(
                    text: '  ·  ',
                  ),
                  TextSpan(
                    text:
                        '${seriesInfoItem.rating.average}/${seriesInfoItem.rating.maxRating()}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
