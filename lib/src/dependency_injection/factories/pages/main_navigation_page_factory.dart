import 'package:flutter/material.dart';

import '../../../presentation/presenters/favorites_presenter/favorites_presenter.dart';
import '../../../presentation/presenters/home_presenter/home_presenter.dart';
import '../../injection_container.dart';
import '../../../presentation/presenters/main_navigation_presenter/main_navigation_presenter.dart';
import '../../../ui/pages/main_navigation/main_navigation_page.dart';

Widget makeMainNavigationPage() => MainNavigationPage(
      mainNavigationPresenter: serviceLocator<MainNavigationPresenter>(),
      homePresenter: serviceLocator<HomePresenter>(),
      favoritesPresenter: serviceLocator<FavoritesPresenter>(),
    );
