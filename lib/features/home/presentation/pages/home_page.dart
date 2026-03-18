import 'package:address_app/features/home/presentation/controller/home_controller.dart';
import 'package:address_app/features/home/presentation/states/home_states.dart';
import 'package:address_app/features/home/presentation/pages/widgets/home_body_widget.dart';
import 'package:address_app/features/home/presentation/pages/widgets/home_error_widget.dart';
import 'package:address_app/features/home/presentation/pages/widgets/home_header_widget.dart';
import 'package:address_app/features/home/presentation/pages/widgets/home_loaded_widget.dart';
import 'package:address_app/features/home/presentation/pages/widgets/home_loading_widget.dart';
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
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: controller.cepDigitsLength,
            builder: (context, value, child) {
              return HomeHeaderWidget(controller: controller);
            },
          ),
          ValueListenableBuilder(
            valueListenable: controller.homeStates,
            builder: (context, state, child) => switch (state) {
              HomeInitialState() => HomeBodyWidget(),
              HomeLoadingState() => HomeLoadingWidget(),
              HomeLoadedState() => HomeLoadedWidget(
                address: state.address,
                controller: controller,
              ),
              HomeErrorState() => HomeErrorWidget(
                message: state.message,
              ),
            },
          ),
        ],
      ),
    );
  }
}
