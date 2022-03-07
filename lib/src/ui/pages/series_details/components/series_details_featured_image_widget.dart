import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_all_series/series_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/series_details_presenter/series_details_presenter.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_colors.dart';

import '../../../mixins/snackbar_message.dart';
import '../../shared/components/image_widget.dart';

class SeriesDetailsFeaturedImageWidget extends StatefulWidget {
  final String heroTag;
  final SeriesBasicInfoEntity seriesInfo;
  final SeriesDetailsPresenter presenter;
  const SeriesDetailsFeaturedImageWidget({
    Key? key,
    required this.seriesInfo,
    required this.presenter,
    required this.heroTag,
  }) : super(key: key);

  @override
  State<SeriesDetailsFeaturedImageWidget> createState() =>
      _SeriesDetailsFeaturedImageWidgetState();
}

class _SeriesDetailsFeaturedImageWidgetState
    extends State<SeriesDetailsFeaturedImageWidget> with SnackbarMessage {
  @override
  void initState() {
    super.initState();

    widget.presenter.isSeriesFavorite(id: widget.seriesInfo.id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: widget.heroTag,
          child:
              ImageWidget(imageNetworkPath: widget.seriesInfo.image.original),
        ),
        StreamBuilder(
            stream: widget.presenter.isSeriesFavoritedStream,
            builder: (context, isFavoritedSnapshot) {
              if (isFavoritedSnapshot.hasData &&
                  isFavoritedSnapshot.data == true) {
                return buildRemoveFromFavoritesButton();
              } else if (isFavoritedSnapshot.hasData &&
                  isFavoritedSnapshot.data == false) {
                return buildAddToFavoritesButton();
              }

              return buildLoadingButton();
            }),
      ],
    );
  }

  Widget buildLoadingButton() {
    return const Positioned(
      right: 16,
      bottom: 16,
      child: FloatingActionButton(
        onPressed: null,
        child: CircularProgressIndicator(),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
    );
  }

  Widget buildAddToFavoritesButton() {
    return Positioned(
      right: 16,
      bottom: 16,
      child: FloatingActionButton(
        child: const Icon(Icons.favorite_border),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        onPressed: () {
          widget.presenter
              .addSeriesToFavorites(id: widget.seriesInfo.id)
              .then((result) {
            if (result) {
              showSnackbar(
                context,
                message: 'Series added to favorites',
              );
            } else {
              showSnackbar(
                context,
                message: 'Error adding series to favorites',
              );
            }
          });
        },
      ),
    );
  }

  Widget buildRemoveFromFavoritesButton() {
    return Positioned(
      right: 16,
      bottom: 16,
      child: FloatingActionButton(
        child: const Icon(Icons.favorite),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        onPressed: () {
          widget.presenter
              .removeSeriesFromFavorites(id: widget.seriesInfo.id)
              .then((result) {
            if (result) {
              showSnackbar(
                context,
                message: 'Series removed from favorites',
              );
            } else {
              showSnackbar(
                context,
                message: 'Error removing series from favorites',
              );
            }
          });
        },
      ),
    );
  }
}
