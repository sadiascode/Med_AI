import 'package:flutter/material.dart';

class CustomNapa extends StatefulWidget {
  const CustomNapa({super.key});

  @override
  State<CustomNapa> createState() => _CustomNapaState();
}

class _CustomNapaState extends State<CustomNapa> {
  int pillCount = 12;

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
          children: [
            const SizedBox(height: 5),
            const Text(
              'Napa Extra',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Tablets || Remaining pills 03 \nRemaining Days 05\nTimes to take 03',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Medication Category: Paracetamol',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black
              ),
            ),
            const SizedBox(height: 25),
            Row(
             children: [
               const Text(
                'You will need 12 more pills',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
               const SizedBox(width: 45),
               Container(
                 decoration: BoxDecoration(
                   color: Color(0xffFFF0E6),
                   borderRadius: BorderRadius.circular(8),
                   border: Border.all(color: const  Color(0xffE0712D), width: 1),
                 ),
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     GestureDetector(
                       onTap: () {
                         if (pillCount > 0) {
                           setState(() {
                             pillCount--;
                           });
                         }
                       },
                       child: Container(
                         width: 32,
                         height: 28,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: const BorderRadius.only(
                             topLeft: Radius.circular(6),
                             bottomLeft: Radius.circular(6),
                           ),
                         ),
                         child: const Icon(
                           Icons.remove,
                           color: Color(0xffE0712D),
                           size: 20,
                         ),
                       ),
                     ),
                     Container(
                       width: 32,
                       height: 28,
                       color: const Color(0xffE0712D),
                       child: Center(
                         child: Text(
                           '$pillCount',
                           style: const TextStyle(
                             fontSize: 18,
                             color: Colors.white,
                           ),
                         ),
                       ),
                     ),
                     GestureDetector(
                       onTap: () {
                         setState(() {
                           pillCount++;
                         });
                       },
                       child: Container(
                         width: 32,
                         height: 28, // reduced height
                         decoration: const BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.only(
                             topRight: Radius.circular(6),
                             bottomRight: Radius.circular(6),
                           ),
                         ),
                         child: const Icon(
                           Icons.add,
                           color:Color(0xffE0712D),
                           size: 20,
                         ),
                       ),
                     ),
                   ],
                 ),
               )

             ],
           ),
         ]
        ),
      )
    );
  }
}
