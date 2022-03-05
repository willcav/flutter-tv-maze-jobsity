import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tv_maze_jobsity/src/data/use_cases/remote_get_all_series_paginated.dart';
import 'package:flutter_tv_maze_jobsity/src/infra/http/dio_adapter.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/home_presenter/getx_home_presenter.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/main_navigation_presenter/getx_main_navigation_presenter.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/pages/main_navigation/main_navigation_page.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'TV Maze Jobsity',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainThemeData,
      home: MainNavigationPage(
        mainNavigationPresenter: GetxMainNavigationPresenter(),
        homePresenter: GetxHomePresenter(
          getAllSeriesPaginatedUseCase: RemoteGetAllSeriesPaginated(
              client: DioAdapter(
                client: Dio(),
              ),
              url: 'https://api.tvmaze.com/shows'),
        ),
      ),
    );
  }
}
