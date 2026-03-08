import 'package:address_app/shared/widgets/app_scaffold_widget.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      currentIndex: 0,
      body: Column(),
    );
  }
}
