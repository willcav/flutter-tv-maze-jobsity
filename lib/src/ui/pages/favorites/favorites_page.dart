import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/favorites_presenter/favorites_presenter.dart';

import '../../../domain/entities/get_all_series/series_basic_info_entity.dart';
import '../../themes/app_colors.dart';
import '../home/components/home_sliding_app_bar.dart';
import '../shared/components/message_widget.dart';
import '../shared/components/series_card.dart';

class FavoritesPage extends StatefulWidget {
  final FavoritesPresenter presenter;
  const FavoritesPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late final ScrollController controller;
  @override
  void initState() {
    super.initState();

    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: HomeSlidingAppBar(
          scrollController: controller,
          action: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StreamBuilder<List<SeriesBasicInfoEntity>>(
              stream: widget.presenter.seriesListStream,
              builder: (context, listSnapshot) {
                if (listSnapshot.hasData && listSnapshot.data!.isNotEmpty) {
                  return buildList(
                    controller: controller,
                    list: listSnapshot.data!,
                  );
                } else if (listSnapshot.hasData && listSnapshot.data!.isEmpty) {
                  return const MessageWidget(
                    message: 'Add your favorites TV Shows and Series here :)',
                  );
                } else if (listSnapshot.hasError) {
                  return const MessageWidget(
                    message: 'Something wrong happened :(',
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ));
  }

  Widget buildList(
      {required ScrollController controller,
      required List<SeriesBasicInfoEntity> list}) {
    return RepaintBoundary(
      child: MasonryGridView.count(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return SeriesCard(
            key: ValueKey(index),
            index: index,
            seriesInfoItem: list[index],
            onTap: widget.presenter.goToSeriesDetailsPage,
          );
        },
      ),
    );
  }
}
