import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/list_all_series/series_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/home_presenter/home_presenter.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/mixins/navigation_manager.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/home/components/home_sliding_app_bar.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_colors.dart';

import '../shared/components/series_card.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  const HomePage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with NavigationManager {
  late final ScrollController controller;
  @override
  void initState() {
    super.initState();

    handleNavigationWithArgs(widget.presenter.navigateToWithArgsStream);

    widget.presenter.getAllSeries();
    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: HomeSlidingAppBar(
          scrollController: controller,
          action: widget.presenter.goToSearchSeriesPage,
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
                  return const Center(
                    child: Text('No Tv Show here :('),
                  );
                } else if (listSnapshot.hasError) {
                  return const Center(
                    child: Text('Something wrong happened :('),
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
    return MasonryGridView.count(
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
    );
  }
}
