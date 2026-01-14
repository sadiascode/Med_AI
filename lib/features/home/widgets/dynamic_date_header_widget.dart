import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DynamicDateHeaderWidget extends StatelessWidget {
  final String prefix;
  final double fontSize;

  const DynamicDateHeaderWidget({
    super.key,
    this.prefix = 'Today',
    this.fontSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM, yyyy').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        '$prefix $formattedDate',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
