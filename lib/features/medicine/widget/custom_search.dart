import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Color(0xFFFFF0E6),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Color(0xff333333)),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search your medicines...",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Color(0xff333333),
                ),
              ),
            ),
           ),
         ]
        ),
      ),
    );
  }
}