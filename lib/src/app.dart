import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_theme.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      title: 'TV Maze Jobsity',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainThemeData,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.pages,
    );
  }
}
