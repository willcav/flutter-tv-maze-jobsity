import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tv_maze_jobsity/src/domain/entities/list_all_series/series_basic_info_entity.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/home_presenter/home_presenter.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/home/components/home_series_card.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/home/components/home_sliding_app_bar.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_colors.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  const HomePage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    widget.presenter.getAllSeries();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: HomeSlidingAppBar(scrollController: controller),
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
        return HomeSeriesCard(index: index, seriesInfoItem: list[index]);
      },
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
  }) : super(key: key);

  final int index;
  final double? extent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: index == 0 || index == 1 ? 32 : 0),
      color: AppColors.grey1,
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
