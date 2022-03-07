import 'package:flutter/material.dart';

import '../../../presentation/presenters/splash_presenter/splash_presenter.dart';
import '../../injection_container.dart';
import '../../../ui/pages/splash/splash_page.dart';

Widget makeSplashPage() =>
    SplashPage(presenter: serviceLocator<SplashPresenter>());
