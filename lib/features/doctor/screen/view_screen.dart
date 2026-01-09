import 'package:care_agent/common/custom_medium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../profile/widget/custom_prescriptions.dart';
import '../widget/custom_doctext.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  late final screenWidth = MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xFFFFFAF7),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
              Column(
                children: [
                  SizedBox(
                  width: screenWidth,
                  child: Image.asset(
                    'assets/doc.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
               ],
              ),
                SizedBox(height: 20),
                Text("Dr. Shakil Mirja",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Color(0xffE0712D)),),
                Text("Cardiologist",style: TextStyle(fontSize: 18, color: Color(0xff646464),),),
                Text("LABAID Hospital",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black,),),

                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Divider(
                    color: Color(0xffFFF0E6),
                    thickness: 1.5,
                    height: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, // aligns icon and text vertically
                    children: [
                      SvgPicture.asset(
                        'assets/arrow.svg',
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),

                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // align text left
                        children: [
                          Text(
                            "Your next follow-up",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "12/24/2025",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Divider(
                    color: Color(0xffFFF0E6),
                    thickness: 1.5,
                    height: 1,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 5),
                        Icon(Icons.add, color: Color(0xFFE0712D), size: 20),
                        SizedBox(width: 8),
                        Text('Add more suggestions',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFE0712D),
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFFE0712D),
                            decorationThickness: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CustomDoctext() ,

                SizedBox(height: 20),
                CustomMedium(text: "Prescriptions from this doctor", onTap: (){}),

                SizedBox(height: 15),
                CustomPrescriptions(
                  prescriptionName: 'Prescriptin-1',
                  date: '01/05/25',
                  onDownload: () {},
                  onShow: () {},
                  onDelete: () {},
                ),

                SizedBox(height: 15),
                CustomPrescriptions(
                  prescriptionName: 'Prescriptin-1',
                  date: '01/05/25',
                  onDownload: () {},
                  onShow: () {},
                  onDelete: () {},
                ),
              ],
            ),
          ),
        ),
    );
  }
}
