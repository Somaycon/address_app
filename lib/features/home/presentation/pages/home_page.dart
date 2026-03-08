import 'package:address_app/features/home/presentation/controller/home_controller.dart';
import 'package:address_app/shared/ui/app_colors.dart';
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
  void initState() {
    super.initState();
    controller = Modular.get<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      currentIndex: 0,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.extraLightGrey,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Buscar por CEP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Digite o CEP para consultar o endereço',
                    style: TextStyle(
                      color: AppColors.lightGrey,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    onChanged: (cep) {
                      controller.onCepChanged(cep);
                      setState(() {});
                    },
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 22,
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 9,
                    controller: controller.cepController,
                    decoration: InputDecoration(
                      fillColor: AppColors.lightGrey.withValues(alpha: 0.1),
                      filled: true,
                      counterText: '',
                      hintText: '00000-000',
                      hintStyle: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 22,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 19,
                          vertical: 14,
                        ),
                        child: Text(
                          '#',
                          style: TextStyle(
                            color: AppColors.lightGrey,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.lightGrey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.lightBlue,
                          width: 2, // opcional
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LinearProgressIndicator(
                    value: controller.cepDigitsLength / 8,
                    color: controller.cepDigitsLength == 8
                        ? AppColors.green
                        : AppColors.darkBlue,
                  ),
                  SizedBox(height: 3),
                  Text(
                    '${controller.cepDigitsLength}/8 dígitos',
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.background,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue.withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: AppColors.darkBlue,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Informe o CEP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'A busca é feita via ViaCEP. Digite o CEP de 8 dígitos.',
                    style: TextStyle(
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
