import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ActionInputBarWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const   ActionInputBarWidget({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                // Capture a photo.
                final XFile? photo = await picker.pickImage(
                    source: ImageSource.camera
                );
              },
              child: SvgPicture.asset(
                'assets/camera.svg',
                height: 32,
                width: 32,
              ),
            ),

            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  print('Mic tapped');
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE67E22),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/mic.svg',
                    height: 32,
                    width: 32,
                  ),
                ),
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
                'assets/plus.svg',
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
