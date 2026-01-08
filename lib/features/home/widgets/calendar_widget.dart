import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  List<Map<String, dynamic>> _generateCenteredWeek() {
    DateTime now = DateTime.now();
    DateTime startDate = now.subtract(const Duration(days: 3));

    return List.generate(7, (index) {
      DateTime date = startDate.add(Duration(days: index));

      bool isToday =
          date.day == now.day &&
          date.month == now.month &&
          date.year == now.year;

      return {
        // If it's today, show full name ('EEEE'), else short name ('E')
        'd': isToday
            ? DateFormat('EEEE').format(date)
            : DateFormat('E').format(date),
        'n': date.day.toString(),
        's': isToday,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final days = _generateCenteredWeek();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment
          .end, // Aligns short days with the bottom of the full day
      children: days.map((day) {
        bool isSel = day['s'] == true;

        return Column(
          children: [
            Text(
              day['d'].toString(),
              style: TextStyle(
                color: isSel ? Colors.black : Colors.grey,
                fontSize: 12,
                // Make the full day name bold if it's today
                fontWeight: isSel ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              constraints: const BoxConstraints(minWidth: 45),
              decoration: BoxDecoration(
                color: isSel ? const Color(0xFFFFF7F0) : Colors.transparent,
                border: Border.all(
                  color: isSel ? const Color(0xFFE67E22) : Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  day['n'].toString(),
                  style: TextStyle(
                    color: isSel ? const Color(0xFFE67E22) : Colors.black,
                    fontWeight: isSel ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
