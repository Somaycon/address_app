import 'package:address_app/features/home/domain/entities/address_entity.dart';
import 'package:address_app/features/home/presentation/controller/home_controller.dart';
import 'package:address_app/features/home/presentation/pages/widgets/tag_widget.dart';
import 'package:address_app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void showAddressModal(
  BuildContext context,
  AddressEntity address,
  HomeController controller,
) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: .min,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'Salvar endereço',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey.withValues(
                    alpha: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  child: Row(
                    spacing: 12,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.lightTeal,
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            address.street,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${address.neighborhood} - ${address.city}, ${address.stateCode}',
                            style: TextStyle(
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'RÓTULO (OPCIONAL)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Wrap(
                spacing: 8,
                runSpacing: 12,
                children: [
                  ...List.generate(controller.labels.length, (index) {
                    final label = controller.labels[index];
                    return TagWidget(
                      controller: controller,
                      label: label,
                    );
                  }),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                ),
                onPressed: () {
                  Modular.to.pop();
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text('Salvar'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
