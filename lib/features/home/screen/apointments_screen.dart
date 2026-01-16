import 'package:care_agent/common/custom_button.dart';
import 'package:care_agent/features/home/screen/home_screen.dart';
import 'package:care_agent/features/home/widgets/custom_date.dart';
import 'package:flutter/material.dart';
import '../../../common/app_shell.dart';
import '../../doctor/widget/custom_Docadd.dart';

class ApointmentsScreen extends StatefulWidget {
  const ApointmentsScreen({super.key});

  @override
  State<ApointmentsScreen> createState() => _ApointmentsScreenState();
}

class _ApointmentsScreenState extends State<ApointmentsScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SubPageScaffold(
      parentTabIndex: 0,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xffE0712D),
            size: 18,
          ),
        ),
        title: const Text(
          "Appointments",
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
              SizedBox( height: MediaQuery.of(context).size.height * 0.01,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: size.height * 0.72,
                width: size.width * 0.92,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    CustomDocadd(
                      title: 'Doctor Name',
                      hint: 'Type doctor name here',
                    ),
                    CustomDocadd(
                      title: 'Specialization',
                      hint: 'Select Specialization',
                      isDropdown: true,
                      dropdownItems: [
                        'General Physician',
                        'Cardiologist',
                        'Dermatologist',
                        'Neurologist',
                        'Gynecologist',
                        'Ophthalmologist',
                        'ENT Specialist',
                        'Psychiatrist',

                      ],
                      onChanged: (value) {},
                    ),
                    CustomDate(title: "Enter Date & Time Paker",
                        hint: "Set your Appointement"
                    ),
                    SizedBox( height: MediaQuery.of(context).size.height * 0.01,),
                    Padding(
                      padding: const EdgeInsets.only(right: 300),
                      child: Text(
                        'Notes',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox( height: MediaQuery.of(context).size.height * 0.01,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      color: Color(0xffFFF0E6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Type your notes here...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                    ),
                  ),
                    SizedBox( height: MediaQuery.of(context).size.height * 0.03,),
                    CustomButton(text: "Confirm", onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    }),
                  ]
                )
              )
            )
          ],
        ),
      ),
    );
  }
}