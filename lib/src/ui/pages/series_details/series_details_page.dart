import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/series_details/components/series_details_sliding_app_bar.dart';
import 'package:get/get.dart';

import '../../../domain/entities/list_all_series/series_basic_info_entity.dart';
import '../../themes/app_colors.dart';

class SeriesDetailsPage extends StatefulWidget {
  const SeriesDetailsPage({Key? key}) : super(key: key);

  @override
  State<SeriesDetailsPage> createState() => _SeriesDetailsPageState();
}

class _SeriesDetailsPageState extends State<SeriesDetailsPage> {
  SeriesBasicInfoEntity? seriesInfo;
  late final ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController();
    seriesInfo = getNavigationArguments(argumentKey: 'seriesInfo');
  }

  T? getNavigationArguments<T>({required String argumentKey}) {
    if (Get.arguments != null && Get.arguments[argumentKey] != null) {
      return Get.arguments[argumentKey] as T;
    }
    return null;
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
                background: seriesInfo != null
                    ? Hero(
                        tag: seriesInfo!.id,
                        child: Image.network(
                          seriesInfo!.image.original,
                          fit: BoxFit.fitWidth,
                        ),
                      )
                    : const SizedBox()),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const Padding(
              padding: EdgeInsets.all(64),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
            // Padding(
            //   padding: const EdgeInsets.all(16),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         seriesInfo!.name,
            //         style: Theme.of(context).textTheme.headline1,
            //       ),
            //       const SizedBox(
            //         height: 8,
            //       ),
            //       Row(
            //         children: const [
            //           Text('Drama'),
            //           SizedBox(
            //             width: 8,
            //           ),
            //           Text('Action'),
            //           SizedBox(
            //             width: 8,
            //           ),
            //           Text('Crime'),
            //         ],
            //       ),
            //       const SizedBox(
            //         height: 8,
            //       ),
            //       const Text(
            //           "New jobs are tough—especially when your new employer is the CIA. Annie Walker is fluent in six languages, has traveled the world and is besting her fellow CIA trainees in every test. But that doesn't explain why she's suddenly summoned by CIA headquarters to report for active duty as a field operative one month before her training is over. She doesn't know there may be something—or someone—from her past that her CIA bosses are really after.<br><br> Annie's unofficial guide to the CIA is Auggie Anderson, a tech ops expert who was blinded while on assignment. As Annie navigates this new world of intrigue, danger and bureaucratic red tape, Auggie is there to make sure this quick study won't be kept in the dark for long. Also starring Peter Gallagher, Kari Matchett, Sendhil Ramamurthy and Anne Dudek"),
            //       Text.rich(
            //         TextSpan(
            //           style: Theme.of(context).textTheme.subtitle1,
            //           children: const [
            //             TextSpan(text: '22:00'),
            //             TextSpan(
            //               text: '  ·  ',
            //             ),
            //             TextSpan(
            //               text: 'Thursday',
            //             ),
            //             TextSpan(
            //               text: '  ·  ',
            //             ),
            //             TextSpan(
            //               text: 'Ended',
            //             ),
            //           ],
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 8,
            //       ),
            //       const Text('Season 1'),
            //       SizedBox(
            //         height: 200,
            //         child: ListView.separated(
            //           physics: const BouncingScrollPhysics(),
            //           scrollDirection: Axis.horizontal,
            //           itemCount: 10,
            //           itemBuilder: (context, index) => Image.network(
            //             seriesInfo!.image.medium,
            //             fit: BoxFit.fitWidth,
            //           ),
            //           separatorBuilder: (context, index) => const SizedBox(
            //             width: 8,
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ])),
        ],
      ),
    );
  }
}
