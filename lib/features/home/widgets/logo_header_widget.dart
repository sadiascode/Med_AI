import 'package:flutter/material.dart';

class LogoHeaderWidget extends StatelessWidget {
  const LogoHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.blur_on, color: Color(0xFFE67E22), size: 45),
        const SizedBox(width: 8),
        const Text(
          'Med AI',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Color(0xFFE67E22),
          ),
        ),
      ],
    );
  }
}
