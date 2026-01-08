import 'package:flutter/material.dart';

class ActionInputBarWidget extends StatelessWidget {
  const ActionInputBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        border: Border.all(color: const Color(0xFFE67E22).withOpacity(0.4)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.camera_alt_outlined, color: Color(0xFFE67E22)),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFE67E22),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.mic, color: Colors.white),
          ),
          const Icon(Icons.add, color: Color(0xFFE67E22), size: 30),
        ],
      ),
    );
  }
}
