import 'package:flutter/material.dart';

class CustomEdit extends StatefulWidget {
  final String title;
  final String? hintText;
  final Color fillColor;
  final TextEditingController? controller;

  const CustomEdit({
    super.key,
    required this.title,
    this.hintText,
    this.controller,
    this.fillColor = const Color(0xFFFFF0E6),
  });

  @override
  State<CustomEdit> createState() => _CustomEditState();
}

class _CustomEditState extends State<CustomEdit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            filled: true,
            fillColor: widget.fillColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
