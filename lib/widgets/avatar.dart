import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double radius;
  final String url;

  const Avatar({Key? key, required this.url, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: radius, backgroundImage: NetworkImage(url));
  }
}
