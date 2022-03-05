import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tv_maze_jobsity/src/presentation/presenters/main_navigation_presenter/main_navigation_presenter.dart';

import '../../../themes/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final MainNavigationPresenter presenter;
  const CustomBottomNavigationBar({Key? key, required this.presenter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: StreamBuilder<int>(
          stream: presenter.index,
          initialData: 0,
          builder: (context, snapshot) {
            return _buildBottomNavigation(
                context: context,
                index: snapshot.data!,
                onTap: (int index) {
                  presenter.setIndex = index;
                });
          },
        ),
      ),
    );
  }

  Widget _buildBottomNavigation({
    required BuildContext context,
    required int index,
    required void Function(int index) onTap,
  }) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColors.white),
        child: BottomNavigationBar(
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(
                path: 'assets/icons/home-outline.svg',
                color: AppColors.grey1,
              ),
              activeIcon: _buildIcon(
                path: 'assets/icons/home.svg',
                color: AppColors.primary,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                path: 'assets/icons/favorite-outline.svg',
                color: AppColors.grey1,
              ),
              activeIcon: _buildIcon(
                path: 'assets/icons/favorite.svg',
                color: AppColors.primary,
              ),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                path: 'assets/icons/user-outline.svg',
                color: AppColors.grey1,
              ),
              activeIcon: _buildIcon(
                path: 'assets/icons/user.svg',
                color: AppColors.primary,
              ),
              label: "People",
            ),
          ],
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.shifting,
          currentIndex: index,
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _buildIcon({required String path, required Color color}) {
    return SvgPicture.asset(
      path,
      color: color,
      width: 24,
      height: 24,
    );
  }
}
