import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_colors.dart';

mixin SnackbarMessage {
  void showSnackbar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: AppColors.white,
              ),
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
