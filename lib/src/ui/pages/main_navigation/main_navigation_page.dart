import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/home_presenter/home_presenter.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/home/home_page.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/main_navigation/components/custom_bottom_navigation_bar.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_colors.dart';

import '../../../presentation/presenters/main_navigation_presenter/main_navigation_presenter.dart';

class MainNavigationPage extends StatelessWidget {
  final MainNavigationPresenter mainNavigationPresenter;
  final HomePresenter homePresenter;
  const MainNavigationPage({
    Key? key,
    required this.mainNavigationPresenter,
    required this.homePresenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<int>(
        stream: mainNavigationPresenter.index,
        initialData: 0,
        builder: (context, snapshot) {
          return IndexedStack(
            children: pages(),
            index: snapshot.data,
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        presenter: mainNavigationPresenter,
      ),
    );
  }

  List<Widget> pages() {
    return [
      HomePage(
        presenter: homePresenter,
      ),
      const Scaffold(
        backgroundColor: AppColors.grey,
        body: Center(
          child: Text('Favorites'),
        ),
      ),
      const Scaffold(
        backgroundColor: AppColors.grey,
        body: Center(
          child: Text('Search People'),
        ),
      ),
    ];
  }
}
