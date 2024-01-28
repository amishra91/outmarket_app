import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final double radius;
  final double width;

  const Search({super.key, required this.width, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: width,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: const Color(0xfff7f7fd),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: const TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(bottom: 15, left: 15),
              hintText: 'Search..'),
        ));
  }
}
