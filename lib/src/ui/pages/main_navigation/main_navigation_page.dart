import 'package:flutter/material.dart';

import '../../../presentation/presenters/favorites_presenter/favorites_presenter.dart';
import '../../../presentation/presenters/home_presenter/home_presenter.dart';
import '../../../presentation/presenters/main_navigation_presenter/main_navigation_presenter.dart';
import '../../../presentation/presenters/people_presenter/people_presenter.dart';
import '../favorites/favorites_page.dart';
import '../home/home_page.dart';
import '../people/people_page.dart';
import 'components/custom_bottom_navigation_bar.dart';

class MainNavigationPage extends StatelessWidget {
  final MainNavigationPresenter mainNavigationPresenter;
  final HomePresenter homePresenter;
  final FavoritesPresenter favoritesPresenter;
  final PeoplePresenter peoplePresenter;

  const MainNavigationPage({
    Key? key,
    required this.mainNavigationPresenter,
    required this.homePresenter,
    required this.favoritesPresenter,
    required this.peoplePresenter,
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
      HomePage(presenter: homePresenter),
      FavoritesPage(presenter: favoritesPresenter),
      PeoplePage(presenter: peoplePresenter),
    ];
  }
}
