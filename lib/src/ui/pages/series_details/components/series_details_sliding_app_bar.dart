import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_colors.dart';

class SeriesDetailsSlidingAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final ScrollController scrollController;

  const SeriesDetailsSlidingAppBar({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<SeriesDetailsSlidingAppBar> createState() => _SlidingAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _SlidingAppBarState extends State<SeriesDetailsSlidingAppBar> {
  Color _color = AppColors.white;

  final duration = const Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      final offset = widget.scrollController.offset;

      if (offset > 300) {
        setState(() {
          _color = AppColors.black;
        });
      } else {
        setState(() {
          _color = AppColors.white;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: _color,
    );
  }
}
