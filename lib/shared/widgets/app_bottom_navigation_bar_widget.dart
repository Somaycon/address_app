import 'package:address_app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  const AppBottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
  });
  Color _colorByIndex(int index) {
    switch (index) {
      case 0:
        return AppColors.darkBlue;
      case 1:
        return AppColors.yellow;
      case 2:
        return AppColors.darkBlue;
      default:
        return AppColors.darkBlue;
    }
  }

  Widget _buildNavIcon(
    BuildContext context,
    IconData icon, {
    required bool active,
  }) {
    final color = _colorByIndex(currentIndex);
    final inactiveColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 2),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: active ? color : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      child: Icon(icon, color: active ? color : inactiveColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: _colorByIndex(currentIndex),
      unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
      items: [
        BottomNavigationBarItem(
          icon: _buildNavIcon(context, Icons.search, active: false),
          activeIcon: _buildNavIcon(context, Icons.search, active: true),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: _buildNavIcon(context, Icons.star_border, active: false),
          activeIcon: _buildNavIcon(context, Icons.star, active: true),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: _buildNavIcon(
            context,
            Icons.location_on_outlined,
            active: false,
          ),
          activeIcon: _buildNavIcon(context, Icons.location_on, active: true),
          label: 'Meus Endereços',
        ),
      ],
    );
  }
}
