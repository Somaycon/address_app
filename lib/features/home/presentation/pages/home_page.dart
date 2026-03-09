import 'package:address_app/features/home/presentation/controller/home_controller.dart';
import 'package:address_app/features/home/presentation/states/home_states.dart';
import 'package:address_app/features/home/presentation/widgets/home_initial_widget.dart';
import 'package:address_app/shared/widgets/app_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;
  @override
  initState() {
    super.initState();
    controller = Modular.get<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      currentIndex: 0,
      body: ValueListenableBuilder(
        valueListenable: controller.homeStates,
        builder: (context, value, child) => switch (value) {
          HomeInitialState() => HomeInitialWidget(
            controller: controller,
          ),
          HomeLoadingState() => Center(
            child: CircularProgressIndicator(),
          ),
          HomeLoadedState() => SizedBox.shrink(),
          HomeErrorState() => SizedBox.shrink(),
        },
      ),
    );
  }
}
