import 'package:address_app/shared/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _colorByIndex(currentIndex),
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        onTap: (index) {
          if (index == currentIndex) return;

          switch (index) {
            case 0:
              Modular.to.navigate('/');
              break;
            case 1:
              Modular.to.navigate('/favorites');
              break;
          }
        },
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
        ],
      ),
    );
  }
}
