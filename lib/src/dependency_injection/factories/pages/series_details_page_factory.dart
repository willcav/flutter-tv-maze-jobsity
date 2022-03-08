import 'package:flutter/material.dart';

import '../../../presentation/presenters/series_details_presenter/series_details_presenter.dart';
import '../../../ui/pages/series_details/series_details_page.dart';
import '../../injection_container.dart';

Widget makeSeriesDetailsPage() =>
    SeriesDetailsPage(presenter: serviceLocator<SeriesDetailsPresenter>());
