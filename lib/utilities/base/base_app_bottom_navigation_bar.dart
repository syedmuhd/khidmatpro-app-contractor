import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class BaseAppBottomNavigationBar extends StatelessWidget {
  final PageController pageController;
  final void Function(int) onPageChanged;

  const BaseAppBottomNavigationBar({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 90.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(UniconsLine.estate, "Home", 0),
            _buildNavItem(UniconsLine.user_square, "Profile", 1),
            _buildNavItem(UniconsLine.server, "Jobs", 2),
            _buildNavItem(UniconsLine.schedule, "Schedules", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
            onPageChanged(index);
          },
        ),
        Text(label),
      ],
    );
  }
}
