import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/search_series_presenter/search_series_presenter.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/mixins/navigation_manager.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/search_series/components/search_series_app_bar.dart';

import '../../../domain/entities/get_all_series/series_basic_info_entity.dart';
import '../../themes/app_colors.dart';
import '../shared/components/message_widget.dart';
import '../shared/components/series_card.dart';

class SearchSeriesPage extends StatefulWidget {
  final SearchSeriesPresenter presenter;
  const SearchSeriesPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<SearchSeriesPage> createState() => _SearchSeriesPageState();
}

class _SearchSeriesPageState extends State<SearchSeriesPage>
    with NavigationManager {
  @override
  void initState() {
    super.initState();

    handleNavigationWithArgs(widget.presenter.navigateToWithArgsStream);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: SearchSeriesAppBar(onChanged: widget.presenter.searchSeries),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: StreamBuilder<List<SeriesBasicInfoEntity>>(
            initialData: const [],
            stream: widget.presenter.seriesListStream,
            builder: (context, listSnapshot) {
              return StreamBuilder(
                  stream: widget.presenter.isLoadingStream,
                  initialData: false,
                  builder: (context, loadingSnapshot) {
                    if (loadingSnapshot.hasData &&
                        loadingSnapshot.data == false) {
                      if (listSnapshot.hasData &&
                          listSnapshot.data!.isNotEmpty) {
                        return buildList(
                          list: listSnapshot.data!,
                        );
                      } else if (listSnapshot.hasData &&
                          listSnapshot.data!.isEmpty) {
                        return const MessageWidget(
                          message: 'Search TV Shows and Series',
                        );
                      } else if (listSnapshot.hasError) {
                        return const MessageWidget(
                          message: 'Something Wrong Happened :(',
                        );
                      }
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  });
            }),
      ),
    );
  }

  Widget buildList({required List<SeriesBasicInfoEntity> list}) {
    return MasonryGridView.count(
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 24,
      crossAxisSpacing: 16,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return SeriesCard(
          key: ValueKey(index),
          heroTag: 'search${list[index].id}',
          index: index,
          seriesInfoItem: list[index],
          onTap: widget.presenter.goToSeriesDetailsPage,
        );
      },
    );
  }
}
