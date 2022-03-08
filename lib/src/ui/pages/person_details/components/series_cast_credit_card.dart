import 'package:flutter/material.dart';

import '../../../../domain/entities/get_all_series/series_basic_info_entity.dart';
import '../../../themes/app_colors.dart';
import '../../shared/components/image_widget.dart';

class SeriesCastCreditCard extends StatelessWidget {
  final int index;
  final String heroTag;
  final SeriesBasicInfoEntity seriesInfoItem;
  final void Function({required SeriesBasicInfoEntity seriesEntity}) onTap;
  const SeriesCastCreditCard({
    Key? key,
    required this.index,
    required this.heroTag,
    required this.seriesInfoItem,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 250,
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
                  tag: heroTag,
                  child: ImageWidget(
                    imageNetworkPath: seriesInfoItem.image.medium,
                    defaultHeight: 250,
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
