import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DynamicDateHeaderWidget extends StatelessWidget {
  final String prefix;
  final double fontSize;

  const DynamicDateHeaderWidget({
    super.key,
    this.prefix = 'Today', // Default prefix
    this.fontSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    // Generate the formatted date string
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
