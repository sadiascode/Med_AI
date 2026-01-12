import 'package:care_agent/features/home/screen/home_screen.dart';
import 'package:care_agent/features/notification/widget/custom_minibutton.dart';
import 'package:flutter/material.dart';

import '../../profile/widget/custom_details.dart';
import '../../profile/widget/custom_details1.dart';

class ChatmedScreen extends StatefulWidget {
  const ChatmedScreen({super.key});

  @override
  State<ChatmedScreen> createState() => _ChatmedScreenState();
}

class _ChatmedScreenState extends State<ChatmedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFAF7),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Color(0xffE0712D), size: 18),
          ),
          title: Text(
            "Prescription Details",
            style: TextStyle(
              color: Color(0xffE0712D),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child:  Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
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

                  SizedBox(height: 20),
                Container(
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xffE0712D), width: 1),
                      ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomDetails(
                                name: 'Medicine Name', medicine: ' Bisocor Tablet 2.5mg',
                              ),
                              SizedBox(height: 10),
                              Text("How many  Bisocor Tablet 2.5mg do you have?",
                                style: TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold),),

                              SizedBox(height: 10),
                              CustomDetails1(name: "How many time/day"),
                            ]
                          )
                        )
                      )
                    ),

                  SizedBox(height: 25),
                  Container(
                      color: Colors.white,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Color(0xffE0712D), width: 1),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomDetails(
                                      name: 'Medicine Name', medicine: ' Bisocor Tablet 2.5mg',
                                    ),
                                    SizedBox(height: 10),
                                    Text("How many  Bisocor Tablet 2.5mg do you have?",
                                      style: TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold),),

                                    SizedBox(height: 10),
                                    CustomDetails1(name: "How many time/day"),
                                  ]
                              )
                          )
                      )
                  ),

                  SizedBox(height: 25),
                  Container(
                      color: Colors.white,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Color(0xffE0712D), width: 1),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomDetails(
                                      name: 'Medicine Name', medicine: ' Bisocor Tablet 2.5mg',
                                    ),
                                    SizedBox(height: 10),
                                    Text("How many  Bisocor Tablet 2.5mg do you have?",
                                      style: TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold),),

                                    SizedBox(height: 10),
                                    CustomDetails1(name: "How many time/day"),
                                  ]
                              )
                          )
                      )
                  ),
                  SizedBox(height: 25),
                  CustomMinibutton(
                      text: "save", onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  }, textcolor: Colors.white,
                      backgroundColor: Color(0xffE0712D)),

                  ]
               )
        )
    );
  }
}
