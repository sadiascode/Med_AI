import 'package:care_agent/features/home/screen/apointments_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class CustomApointment extends StatelessWidget {

  const   CustomApointment({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xffFFFAF7),
          border: Border.all(color: const Color(0xFFE67E22).withOpacity(0.4)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ApointmentsScreen()),
                  );
                },
              child: SvgPicture.asset(
                'assets/plus.svg',
                height: 32,
                width: 32,
              ),
            ),

            InkWell(
              onTap: ()
              async {
                final ImagePicker picker = ImagePicker();
                // Pick an image.
                final XFile? image = await picker.pickImage(
                  source: ImageSource.gallery,
                );
              },
              child: SvgPicture.asset(
                'assets/solar.svg',
                height: 32,
                width: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
