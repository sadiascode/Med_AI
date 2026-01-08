import 'package:care_agent/features/doctor/doctor_screen.dart';
import 'package:care_agent/features/home/home_screen.dart';
import 'package:care_agent/features/medicine/screen/add_screen.dart';
import 'package:care_agent/features/medicine/screen/medicine_screen.dart';
import 'package:care_agent/features/notification/screen/notification_screen.dart';
import 'package:care_agent/features/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      MedicineScreen(),
      DoctorScreen(),
      NotificationScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: screens),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(0, "assets/homes.svg", "Home"),
            _navItem(1, "assets/medicine.svg", "Medicine"),
            _navItem(2, "assets/doctor.svg", "Doctor"),
            _navItem(3, "assets/notification.svg", "Notification"),
            _navItem(4, "assets/profile.svg", "Profile"),
          ],
        ),
      ),
    );
  }

  Widget _navItem(int index, String svgPath, String label) {
    final bool isActive = currentIndex == index;
    const Color orangeColor = Color(0xFFE67E22);

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: isActive ? 65 : 50,
            height: isActive ? 55 : 45,
            decoration: BoxDecoration(
              color: isActive ? orangeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: isActive
                      ? orangeColor.withOpacity(0.3)
                      : Colors.transparent,
                  blurRadius: isActive ? 8.0 : 0.0,
                  offset: isActive ? const Offset(0, 4) : Offset.zero,
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                svgPath,
                color: isActive ? Colors.white : Color(0xffE0712D),
                width: isActive ? 30 : 21,
                height: isActive ? 30 : 21,
              ),
            ),
          ),
          if (!isActive) ...[
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xffE0712D),
                fontWeight: FontWeight.w500,
              ),
            ),
          ] else
            const SizedBox(height: 18),
        ],
      ),
    );
  }
}
