import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../domain/entities/list_all_series/series_basic_info_entity.dart';
import '../../themes/app_colors.dart';
import '../home/components/home_series_card.dart';

class SearchSeriesPage extends StatefulWidget {
  const SearchSeriesPage({Key? key}) : super(key: key);

  @override
  State<SearchSeriesPage> createState() => _SearchSeriesPageState();
}

class _SearchSeriesPageState extends State<SearchSeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.grey,
        title: TextField(
          autofocus: true,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: const InputDecoration(
              suffixIcon: Hero(
            tag: '-searchIcon-',
            child: Icon(
              Icons.search,
              color: AppColors.black,
            ),
          )),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: StreamBuilder<List<SeriesBasicInfoEntity>>(
            initialData: const [],
            builder: (context, listSnapshot) {
              if (listSnapshot.hasData && listSnapshot.data!.isNotEmpty) {
                return buildList(
                  list: listSnapshot.data!,
                );
              } else if (listSnapshot.hasData && listSnapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    'Search Tv Shows by Name 😁',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
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
