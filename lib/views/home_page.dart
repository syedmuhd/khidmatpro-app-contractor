import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/utilities/Base/base_app_bar.dart';
import 'package:khidmatpro_app_vendor/utilities/Base/base_app_bottom_navigation_bar.dart';
import 'package:khidmatpro_app_vendor/utilities/Base/base_app_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PageController _pageController = PageController();
  final RxInt _currentPage = 0.obs;
  final GlobalKey<ScaffoldState> _homePageKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homePageKey,
      appBar: BaseAppBar(homePageKey: _homePageKey),
      drawer: const BaseAppDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _currentPage.value = index;
        },
        children: const [
          Center(child: Text('Home')),
          Center(child: Text('Quotes')),
          Center(child: Text('Schedules')),
        ],
      ),
      bottomNavigationBar: BaseAppBottomNavigationBar(
        pageController: _pageController,
        onPageChanged: (index) {
          _currentPage.value = index;
        },
      ),
    );
  }
}
