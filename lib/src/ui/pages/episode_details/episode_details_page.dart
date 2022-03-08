import 'package:flutter/material.dart';

import '../../../domain/entities/core/episode_entity.dart';
import '../../mixins/navigation_manager.dart';
import '../../themes/app_colors.dart';
import '../series_details/components/series_details_sliding_app_bar.dart';
import '../shared/components/image_widget.dart';
import 'components/episode_details_content.dart';

class EpisodeDetailsPage extends StatefulWidget {
  const EpisodeDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<EpisodeDetailsPage> createState() => _EpisodeDetailsPageState();
}

class _EpisodeDetailsPageState extends State<EpisodeDetailsPage>
    with NavigationManager {
  EpisodeEntity? episode;
  late final ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController();

    episode = getNavigationArguments<EpisodeEntity>(argumentKey: 'episode');
  }

  @override
  Widget build(BuildContext context) {
    if (episode == null) {
      return const Scaffold(
        backgroundColor: AppColors.grey,
      );
    }
    return Scaffold(
      backgroundColor: AppColors.grey,
      extendBodyBehindAppBar: true,
      appBar: SeriesDetailsSlidingAppBar(scrollController: controller),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.grey,
            automaticallyImplyLeading: false,
            elevation: 0,
            stretch: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                stretchModes: const [
                  StretchMode.blurBackground,
                  StretchMode.zoomBackground
                ],
                background: episode != null
                    ? Hero(
                        tag: '${episode!.id}${episode!.name}',
                        child: ImageWidget(
                            imageNetworkPath: episode!.image.original),
                      )
                    : const SizedBox()),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            EpisodeDetailsContent(episode: episode!),
          ])),
        ],
      ),
    );
  }
}
