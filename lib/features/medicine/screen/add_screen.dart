import 'package:care_agent/common/custom_button.dart';
import 'package:care_agent/features/medicine/screen/calender_screen.dart';
import 'package:care_agent/features/medicine/screen/checkout_screen.dart';
import 'package:care_agent/features/medicine/widget/custom_dosages.dart';
import 'package:care_agent/features/medicine/widget/custom_napa.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF7),
      body: SingleChildScrollView(
        child: Column(
          children: [
              SizedBox(
                width: screenWidth,
                child: Image.asset(
                  'assets/pills.png',
                  fit: BoxFit.fitWidth,
                ),
              ),

            const SizedBox(height: 35),
            CustomNapa(),

            SizedBox(height: 25),
            CustomDosages(),

            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(15),
              child: CustomButton(
                text: "Next",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckoutScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
