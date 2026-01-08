import 'package:flutter/material.dart';

class CustomCheckout extends StatelessWidget {
  const CustomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      width: 380,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffFFF0E6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/box.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Napa Extra',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffE0712D),
                  ),
                ),
                Text(
                  'Quantity: 20',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffE0712D),
                  ),
                ),

                Text(
                  'Price: \$20',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffE0712D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
