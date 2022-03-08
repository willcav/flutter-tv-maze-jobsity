import 'package:flutter/material.dart';

import '../../../presentation/presenters/search_series_presenter/search_series_presenter.dart';
import '../../../ui/pages/search_series/search_series_page.dart';
import '../../injection_container.dart';

Widget makeSearchSeriesPage() =>
    SearchSeriesPage(presenter: serviceLocator<SearchSeriesPresenter>());
