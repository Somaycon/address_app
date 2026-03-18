import 'package:address_app/features/home/domain/entities/address_entity.dart';
import 'package:address_app/features/home/presentation/controller/home_controller.dart';
import 'package:address_app/features/home/presentation/pages/widgets/show_addres_modal.dart';
import 'package:address_app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

class AddressCardWidget extends StatelessWidget {
  final AddressEntity address;
  final HomeController controller;
  const AddressCardWidget({
    super.key,
    required this.address,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'CEP ${address.postalCode}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Logadouro',
                  style: TextStyle(
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    address.street,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Bairro',
                          style: TextStyle(
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          address.neighborhood,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Uf',
                            style: TextStyle(
                              color: AppColors.lightGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            address.stateCode,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Município',
                  style: TextStyle(
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  address.city,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  height: 32,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Salvar este endereço nas suas listas',
                        style: TextStyle(
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.background,
                        foregroundColor: AppColors.darkBlue,
                        elevation: 0,
                        shape: StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                      onPressed: () {
                        showAddressModal(context, address, controller);
                      },
                      icon: Icon(
                        Icons.bookmark_border,
                        size: 20,
                      ),
                      label: Text(
                        'Salvar',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
