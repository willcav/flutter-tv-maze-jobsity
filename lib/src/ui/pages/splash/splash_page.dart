import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/splash_presenter/splash_presenter.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/mixins/navigation_manager.dart';
import 'package:lottie/lottie.dart';

import '../../themes/app_colors.dart';

class SplashPage extends StatefulWidget {
  final SplashPresenter presenter;
  const SplashPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with NavigationManager {
  @override
  void initState() {
    super.initState();

    handleNavigationWithArgs(widget.presenter.navigateToWithArgsStream);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Lottie.asset('assets/animations/retro-tv.json',
              onLoaded: (comp) async {
            Future.delayed(
              Duration(seconds: comp.duration.inSeconds ~/ 2),
              widget.presenter.goToMainPage,
            );
          }),
        ));
  }
}
