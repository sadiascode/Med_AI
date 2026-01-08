import 'package:flutter/material.dart';

class CustomNapa extends StatelessWidget {
  const CustomNapa({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 218,
      width: 380,
      decoration: BoxDecoration(
        color: Color(0xffFFF0E6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 5),
            Text(
              'Napa Extra',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Tablets || Remaining pills 03 \nRemaining Days 05\nTimes to take 03',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Medication Category: Paracetamol',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black
              ),
            ),
            SizedBox(height: 25),
            Row(
             children: [
               Text(
                'You will need 12 more pills',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
               SizedBox(width: 20),
             ]
            ),
          ],
        ),
      ),
    );
  }
}
