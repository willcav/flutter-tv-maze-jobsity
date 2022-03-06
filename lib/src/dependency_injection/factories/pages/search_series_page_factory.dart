import 'package:flutter/material.dart';

import '../../injection_container.dart';
import '../../../ui/pages/search_series/search_series_page.dart';
import '../../../presentation/presenters/search_series_presenter/search_series_presenter.dart';

Widget makeSearchSeriesPage() =>
    SearchSeriesPage(presenter: serviceLocator<SearchSeriesPresenter>());
