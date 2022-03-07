import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/get_all_series/series_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/home_presenter/home_presenter.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/mixins/navigation_manager.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/shared/components/sliding_app_bar.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_colors.dart';

import '../shared/components/message_widget.dart';
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

    controller = ScrollController()
      ..addListener(() {
        if (controller.position.pixels >=
            controller.position.maxScrollExtent - 500) {
          widget.presenter.loadMoreSeries();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: SlidingAppBar(
          title: 'Shows',
          scrollController: controller,
          action: widget.presenter.goToSearchSeriesPage,
          icon: const Hero(
            tag: '-searchIcon-',
            child: Icon(
              Icons.search,
              color: AppColors.black,
            ),
          ),
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
                    message: 'No TV Shows or Series here',
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
