import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/search_series_presenter/search_series_presenter.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/search_series/components/search_series_app_bar.dart';

import '../../../domain/entities/list_all_series/series_basic_info_entity.dart';
import '../../themes/app_colors.dart';
import '../home/components/home_series_card.dart';

class SearchSeriesPage extends StatefulWidget {
  final SearchSeriesPresenter presenter;
  const SearchSeriesPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<SearchSeriesPage> createState() => _SearchSeriesPageState();
}

class _SearchSeriesPageState extends State<SearchSeriesPage> {
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
                        return Center(
                          child: Text(
                            'Search TV Shows 😁',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontWeight: FontWeight.w300),
                          ),
                        );
                      } else if (listSnapshot.hasError) {
                        return const Center(
                          child: Text('Something wrong happened 😞'),
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
        return HomeSeriesCard(
            key: ValueKey(index), index: index, seriesInfoItem: list[index]);
      },
    );
  }
}
