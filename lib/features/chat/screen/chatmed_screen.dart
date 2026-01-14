import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';
import '../../profile/widget/custom_details.dart';
import '../../profile/widget/custom_details1.dart';
import '../widget/custom_minibutton.dart';

class ChatmedScreen extends StatefulWidget {
  const ChatmedScreen({super.key});

  @override
  State<ChatmedScreen> createState() => _ChatmedScreenState();
}

class _ChatmedScreenState extends State<ChatmedScreen> {
  @override
  Widget build(BuildContext context) {
    return SubPageScaffold(
      parentTabIndex: 3,
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
          "Prescription Details",
          style: TextStyle(
            color: Color(0xffE0712D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Medicine quantity',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xffE0712D), width: 1),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDetails(
                        name: 'Medicine Name',
                        medicine: ' Bisocor Tablet 2.5mg',
                      ),
                      SizedBox(height: 10),
                      Text(
                        "How many  Bisocor Tablet 2.5mg do you have?",
                        style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      CustomDetails1(name: "How many time/day"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xffE0712D), width: 1),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDetails(
                        name: 'Medicine Name',
                        medicine: ' Bisocor Tablet 2.5mg',
                      ),
                      SizedBox(height: 10),
                      Text(
                        "How many  Bisocor Tablet 2.5mg do you have?",
                        style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      CustomDetails1(name: "How many time/day"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xffE0712D), width: 1),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDetails(
                        name: 'Medicine Name',
                        medicine: ' Bisocor Tablet 2.5mg',
                      ),
                      SizedBox(height: 10),
                      Text(
                        "How many  Bisocor Tablet 2.5mg do you have?",
                        style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      CustomDetails1(name: "How many time/day"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            CustomMinibutton(
              text: "save",
              onTap: () {

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const AppShell(initialIndex: 3)),
                  (route) => false,
                );
              },
              textcolor: Colors.white,
              backgroundColor: const Color(0xffE0712D),
            ),
          ],
        ),
      ),
    );
  }
}
