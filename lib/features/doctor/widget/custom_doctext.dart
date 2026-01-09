import 'package:flutter/material.dart';

class CustomDoctext extends StatelessWidget {
  const CustomDoctext({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Date Section
          _buildDateSection(
            date: 'Dec 01, 2025',
            advices: [
              'Limit Salt Intake To Reduce Blood Pressure',
              'Avoid Oily, Fried And Highly Processed Foods',
            ],
          ),
          SizedBox(height: 24),

          // Second Date Section
          _buildDateSection(
            date: 'October 11, 2025',
            advices: [
              'Do Light To Moderate Exercise For 20-30 Minutes A Day, Unless Advised Otherwise.',
              'Stop Exercising Immediately If You Feel Chest Pain, Shortness Of Breath, Or Dizziness',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateSection({
    required String date,
    required List<String> advices,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          date,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12),

        ...advices.map((advice) => _buildAdviceItem(advice)),
      ],
    );
  }

  Widget _buildAdviceItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 6),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Color(0xFFFF6B35),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12),

          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


