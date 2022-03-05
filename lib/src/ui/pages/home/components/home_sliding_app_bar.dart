import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_colors.dart';

class HomeSlidingAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController scrollController;

  const HomeSlidingAppBar({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<HomeSlidingAppBar> createState() => _SlidingAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _SlidingAppBarState extends State<HomeSlidingAppBar>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  bool _visible = true;

  final duration = const Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(duration: duration, vsync: this);

    widget.scrollController.addListener(() {
      final direction = widget.scrollController.position.userScrollDirection;

      if (direction == ScrollDirection.reverse) {
        setState(() {
          _visible = false;
        });
      } else {
        setState(() {
          _visible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _visible ? animationController.reverse() : animationController.forward();
    return AnimatedContainer(
      height: Tween<double>(begin: 80, end: 0)
          .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear),
          )
          .value,
      duration: duration,
      child: AppBar(
        elevation: 0,
        backgroundColor: AppColors.grey,
        title: Text(
          'TV Shows',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.black,
              )),
        ],
      ),
    );
  }
}
