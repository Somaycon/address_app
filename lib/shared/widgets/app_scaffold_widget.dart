import 'package:address_app/shared/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class AppScaffoldWidget extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  const AppScaffoldWidget({
    super.key,
    required this.body,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: body,
      ),
      bottomNavigationBar: AppBottomNavigationBarWidget(
        currentIndex: currentIndex,
      ),
    );
  }
}
