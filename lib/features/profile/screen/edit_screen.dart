import 'package:care_agent/common/custom_button.dart';
import 'package:care_agent/common/custom_medium.dart';
import 'package:care_agent/features/profile/screen/profile_screen.dart';
import 'package:care_agent/features/profile/widget/custom_edit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common/app_shell.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
          "Edit Profile",
          style: TextStyle(
            color: Color(0xffE0712D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  // Pick an image.
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                },
                child: const Text(
                  'Change photo',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffE0712D),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xffE0712D),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CustomMedium(text: "Profile Info", onTap: () {}),
              const SizedBox(height: 20),
              CustomEdit(
                title: "Full Name",
                hintText: "Enter your name",
                controller: TextEditingController(),
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: "Email",
                hintText: "Enter your name",
                controller: TextEditingController(),
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: "Phone Number",
                hintText: "Type your phone number",
                controller: TextEditingController(),
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: "Address",
                hintText: "Type your address here",
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              CustomMedium(text: "Other Info", onTap: () {}),
              const SizedBox(height: 30),
              CustomEdit(
                title: "Age",
                hintText: "Type your age here",
                controller: TextEditingController(),
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: "Health condition",
                hintText: "Type your health condition here",
                controller: TextEditingController(),
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: "Wakeup time",
                hintText: "Type your wakeup time",
                controller: TextEditingController(),
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: "Breakfast time",
                hintText: "Type your breakfast time",
                controller: TextEditingController(),
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: "Lunch time",
                hintText: "Type your lunch time",
                controller: TextEditingController(),
              ),
              const SizedBox(height: 15),
              CustomEdit(
                title: "Dinner time",
                hintText: "Type your dinner time",
                controller: TextEditingController(),
              ),
              const SizedBox(height: 30),
              CustomButton(text: "Save", onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
