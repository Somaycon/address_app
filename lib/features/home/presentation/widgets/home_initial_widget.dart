import 'package:address_app/features/home/presentation/controller/home_controller.dart';
import 'package:address_app/features/home/presentation/widgets/home_header_widget.dart';
import 'package:address_app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

class HomeInitialWidget extends StatefulWidget {
  final HomeController controller;
  const HomeInitialWidget({
    super.key,
    required this.controller,
  });

  @override
  State<HomeInitialWidget> createState() => _HomeInitialWidgetState();
}

class _HomeInitialWidgetState extends State<HomeInitialWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller.cepDigitsLength,
      builder: (context, value, child) {
        return Column(
          children: [
            HomeHeaderWidget(controller: widget.controller),
            Expanded(
              child: Container(
                color: AppColors.background,
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.all(16),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.lightBlue.withValues(alpha: 0.16),
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: AppColors.darkBlue,
                          size: 40,
                        ),
                      ),
                      Text(
                        'Informe o CEP',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'A busca é feita via ViaCEP.',
                        style: TextStyle(
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
