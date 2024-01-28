import 'package:flutter/material.dart';
import 'package:outmarket_app/screens/screens.dart';
import 'package:outmarket_app/size_utils.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return MaterialApp(
      title: 'Outmarket AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(
        Theme.of(context).textTheme,
      )),
      home: const HomeScreen(),
    );
  }
}
