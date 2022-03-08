import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/person_details/components/person_details_content_widget.dart';

import '../../../domain/entities/search_people/person_basic_info_entity.dart';
import '../../../presentation/presenters/person_details_presenter/person_details_presenter.dart';
import '../../mixins/navigation_manager.dart';
import '../../themes/app_colors.dart';
import '../series_details/components/series_details_sliding_app_bar.dart';
import '../shared/components/image_widget.dart';

class PersonDetailsPage extends StatefulWidget {
  final PersonDetailsPresenter presenter;
  const PersonDetailsPage({Key? key, required this.presenter})
      : super(key: key);

  @override
  State<PersonDetailsPage> createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends State<PersonDetailsPage>
    with NavigationManager {
  late final ScrollController controller;
  PersonBasicInfoEntity? personInfo;

  @override
  void initState() {
    super.initState();

    controller = ScrollController();

    personInfo = getNavigationArguments(argumentKey: 'person');
  }

  @override
  Widget build(BuildContext context) {
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
                background: personInfo != null
                    ? Hero(
                        tag: 'people${personInfo!.id}',
                        child: ImageWidget(
                            imageNetworkPath: personInfo!.image.original),
                      )
                    : const SizedBox()),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            PersonDetailsContentWidget(personInfo: personInfo!),
            // StreamBuilder<SeriesDetailedInfoEntity?>(
            //     stream: widget.presenter.seriesDetailsStream,
            //     builder: (context, streamSnapshot) {
            //       if (streamSnapshot.hasData && streamSnapshot.data != null) {
            //         return Column(
            //           children: [
            //             SeriesDetailsContent(
            //               seriesDetails: streamSnapshot.data!,
            //             ),
            //             SeasonsInfoWidget(
            //               seasons: streamSnapshot.data!.seasons,
            //               episodeOnTapAction:
            //                   widget.presenter.goToEpisodeDetailsPage,
            //             ),
            //           ],
            //         );
            //       } else if (streamSnapshot.hasError) {
            //         return const Padding(
            //           padding: EdgeInsets.all(64),
            //           child: Center(
            //             child: Text('Something Wrong Happened'),
            //           ),
            //         );
            //       }
            //       return const Padding(
            //         padding: EdgeInsets.all(64),
            //         child: Center(
            //           child: CircularProgressIndicator(),
            //         ),
            //       );
            //     })
          ])),
        ],
      ),
    );
  }
}
