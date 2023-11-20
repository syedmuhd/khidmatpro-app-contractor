import 'package:flutter/material.dart';
import 'package:khidmatpro_app_vendor/utilities/base/base_page_app_bar.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _pageKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasePageAppBar(homePageKey: _pageKey),
      body: const SingleChildScrollView(
        child: Center(
          child: Text("Content"),
        ),
      ),
    );
  }
}
