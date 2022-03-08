import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/mixins/navigation_manager.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/people/components/search_people_app_bar.dart';

import '../../../domain/entities/search_people/person_basic_info_entity.dart';
import '../../../presentation/presenters/people_presenter/people_presenter.dart';
import '../../themes/app_colors.dart';
import '../shared/components/message_widget.dart';
import 'components/person_card.dart';

class PeoplePage extends StatefulWidget {
  final PeoplePresenter presenter;
  const PeoplePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> with NavigationManager {
  late final ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();

    handleNavigationWithArgs(widget.presenter.navigateToWithArgsStream);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: SearchPeopleAppBar(
          controller: controller,
          onChanged: widget.presenter.searchPeople,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StreamBuilder<List<PersonBasicInfoEntity>>(
              initialData: const [],
              stream: widget.presenter.peopleListStream,
              builder: (context, listSnapshot) {
                return StreamBuilder(
                    initialData: false,
                    stream: widget.presenter.isLoadingStream,
                    builder: (context, loadingSnapshot) {
                      if (loadingSnapshot.hasData &&
                          loadingSnapshot.data == false) {
                        if (listSnapshot.hasData &&
                            listSnapshot.data!.isNotEmpty) {
                          return buildList(
                            controller: controller,
                            list: listSnapshot.data!,
                          );
                        } else if (listSnapshot.hasData &&
                            listSnapshot.data!.isEmpty) {
                          return const MessageWidget(
                            message: 'No People to show here',
                          );
                        } else if (listSnapshot.hasError) {
                          return const MessageWidget(
                            message: 'Something wrong happened :(',
                          );
                        }

                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
              }),
        ));
  }

  Widget buildList(
      {required ScrollController controller,
      required List<PersonBasicInfoEntity> list}) {
    return RepaintBoundary(
      child: MasonryGridView.count(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return PersonCard(
            key: ValueKey(index),
            heroTag: 'people${list[index].id}',
            index: index,
            personInfoItem: list[index],
            onTap: widget.presenter.goToPersonDetailsPage,
          );
        },
      ),
    );
  }
}
