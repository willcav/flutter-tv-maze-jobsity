import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/list_all_series/series_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/routes/app_routes.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_colors.dart';
import 'package:get/get.dart';

class HomeSeriesCard extends StatelessWidget {
  final int index;
  final SeriesBasicInfoEntity seriesInfoItem;
  const HomeSeriesCard({
    Key? key,
    required this.index,
    required this.seriesInfoItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: index == 0 || index == 1 ? 32 : 0),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.seriesDetailsPage,
              arguments: {'seriesInfo': seriesInfoItem});
        },
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
                  tag: seriesInfoItem.id,
                  child: Image.network(
                    seriesInfoItem.image.medium,
                    fit: BoxFit.fitHeight,
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
