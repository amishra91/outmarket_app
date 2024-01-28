import 'package:flutter/material.dart';
import 'package:outmarket_app/helpers.dart';
import 'package:outmarket_app/pages/messages_page.dart';
import 'package:outmarket_app/colors.dart';
import 'package:outmarket_app/widgets/sidebar.dart';
import 'package:outmarket_app/widgets/widgets.dart';
import 'package:faker/faker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Faker faker = Faker();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Menu
          const Sidebar(),
          Container(
            width: 0.5,
            height: double.infinity,
            color: AppColors.dark,
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Column(
                children: [
                  //Header
                  Header(
                    name: faker.person.name(),
                    profilePhoto: Helpers.randomPictureUrl(),
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: AppColors.dark,
                  ),
                  Expanded(
                    child:
                        Container(color: Colors.white, child: MessagesPage()),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
