import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const Color primaryColor = Color(0xFFFF6B35);

  //  SVG paths
  final List<String> _icons = const [
    'assets/homes.svg',
    'assets/medicine.svg',
    'assets/icons/doctor.svg',
    'assets/notification.svg',
    'assets/profile.svg',
  ];

  final List<String> _labels = const [
    'Home',
    'Medicine',
    'Doctor',
    'Notification',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_icons.length, (index) {
          if (index == currentIndex) {
            //  Selected index → orange box + white SVG
            return _buildSelectedItem(
              iconPath: _icons[index],
              onTap: () => onTap(index),
            );
          } else {
            //  Normal item
            return _buildNavItem(
              iconPath: _icons[index],
              label: _labels[index],
              onTap: () => onTap(index),
            );
          }
        }),
      ),
    );
  }

  //  Selected item (orange box)
  Widget _buildSelectedItem({
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: 30,
            height: 30,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }

  //Normal nav item
  Widget _buildNavItem({
    required String iconPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 26,
            height: 26,
            colorFilter: ColorFilter.mode(
              Colors.grey.shade400,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xffE0712D),
            ),
          ),
        ],
      ),
    );
  }
}
