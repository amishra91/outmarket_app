import 'package:flutter/material.dart';
import 'package:outmarket_app/screens/screens.dart';
import 'package:outmarket_app/size_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeUtils.init(context);
    return const MaterialApp(
      title: 'Outmarket AI',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
