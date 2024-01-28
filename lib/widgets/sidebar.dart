import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 20),
      child: Column(
        children: [
          Container(
            color: const Color(0xFFEB5757),
            padding:
                const EdgeInsets.only(left: 32, right: 32, top: 14, bottom: 14),
            child: const Text(
              'OM Chat',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
