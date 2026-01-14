import 'package:care_agent/common/custom_medium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/app_shell.dart';
import '../../profile/screen/prescription_screen.dart';
import '../../profile/widget/custom_prescriptions.dart';
import '../widget/custom_doctext.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SubPageScaffold(
      parentTabIndex: 2,
      backgroundColor: const Color(0xFFFFFAF7),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xffE0712D), size: 18),
        ),
        title: const Text(
          "Doctor",
          style: TextStyle(
            color: Color(0xffE0712D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
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
              const SizedBox(height: 20),
              const Text(
                "Dr. Shakil Mirja",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xffE0712D)),
              ),
              const Text(
                "Cardiologist",
                style: TextStyle(fontSize: 18, color: Color(0xff646464)),
              ),
              const Text(
                "LABAID Hospital",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Color(0xffFFF0E6),
                  thickness: 1.5,
                  height: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/arrow.svg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your next follow-up",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
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
              const SizedBox(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Color(0xffFFF0E6),
                  thickness: 1.5,
                  height: 1,
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 5),
                      Icon(Icons.add, color: Color(0xFFE0712D), size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Add more suggestions',
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
              const SizedBox(height: 10),
              const CustomDoctext(),
              const SizedBox(height: 20),
              CustomMedium(text: "Prescriptions from this doctor", onTap: () {}),
              const SizedBox(height: 15),
              CustomPrescriptions(
                prescriptionName: 'Prescriptin-1',
                date: '01/05/25',
                onDownload: () {},
                onShow: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrescriptionScreen()),
                  );
                },
                onDelete: () {},
              ),
              const SizedBox(height: 15),
              CustomPrescriptions(
                prescriptionName: 'Prescriptin-1',
                date: '01/05/25',
                onDownload: () {},
                onShow: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrescriptionScreen()),
                  );
                },
                onDelete: () {},
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
