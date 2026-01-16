import 'package:flutter/material.dart';

class CustomDocadd extends StatefulWidget {
  final String title;
  final String hint;
  final List<String>? dropdownItems;
  final bool isDropdown;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomDocadd({
    super.key,
    required this.title,
    required this.hint,
    this.dropdownItems,
    this.isDropdown = false,
    this.controller,
    this.onChanged,
  });

  @override
  State<CustomDocadd> createState() => _CustomDocaddState();
}

class _CustomDocaddState extends State<CustomDocadd> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),

          widget.isDropdown
              ? _buildDropdown()
              : _buildTextField(),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xffFFF0E6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 15,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xffFFF0E6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(
            widget.hint,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
          ),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
          dropdownColor: Colors.white,
          items: widget.dropdownItems?.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 16,
                  color:  Colors.black,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            if (widget.onChanged != null && newValue != null) {
              widget.onChanged!(newValue);
            }
          },
        ),
      ),
    );
  }
}
