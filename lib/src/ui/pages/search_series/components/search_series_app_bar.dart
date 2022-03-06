import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class SearchSeriesAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final void Function(String text) onChanged;
  const SearchSeriesAppBar({Key? key, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColors.black,
      backgroundColor: AppColors.grey,
      title: TextField(
        autofocus: true,
        style: Theme.of(context).textTheme.bodyText1,
        onChanged: onChanged,
        onSubmitted: onChanged,
        decoration: const InputDecoration(
            suffixIcon: Hero(
          tag: '-searchIcon-',
          child: Icon(
            Icons.search,
            color: AppColors.black,
          ),
        )),
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
