import 'package:care_agent/common/app_shell.dart';
import 'package:care_agent/features/profile/screen/prescription_screen.dart';
import 'package:care_agent/features/profile/widget/custom_prescriptions.dart';
import 'package:flutter/material.dart';

class PrescpScreen extends StatelessWidget {
  const PrescpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SubPageScaffold(
        parentTabIndex: 4,
        backgroundColor: const Color(0xFFFFFAF7),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xffE0712D), size: 18),
          ),
          title: const Text(
            "Prescription",
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
                SizedBox(height: 20),
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

                SizedBox(height: 15),

                CustomPrescriptions( prescriptionName: 'Prescriptin-1',
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
                SizedBox(height: 15),

                CustomPrescriptions( prescriptionName: 'Prescriptin-1',
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
                SizedBox(height: 15),

                CustomPrescriptions( prescriptionName: 'Prescriptin-1',
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
                SizedBox(height: 10),
              ],
            ),
          ),
        )
    );
  }
}
