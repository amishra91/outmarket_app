import 'package:flutter/material.dart';
import 'package:outmarket_app/models/message_data.dart';
import 'package:outmarket_app/widgets/message_view.dart';
import 'package:outmarket_app/widgets/widgets.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  BuildContext? _context;

  List<User> users = <User>[]; // empty list
  int currentUserSelectedIndex = 0;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (_context != null) {
        var users = await MockUserData().getMockUserList(_context!);
        setState(() {
          this.users = users;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Row(
      children: [
        Container(
          width: 400,
          color: Colors.white,
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Messaging",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      const Text("Filter",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )),
                      const SizedBox(
                        width: 4,
                      ),
                      Image.asset(
                        "assets/icons/sort.png",
                        width: 24.0,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Row(
                children: [Expanded(child: Search(width: 400, radius: 0))],
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => setState(() {
                        currentUserSelectedIndex = index;
                      }),
                      child: MessageTile(
                        isActive:
                            index == currentUserSelectedIndex ? true : false,
                        user: users[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // Message View

        users.isEmpty
            ? Container()
            : Expanded(
                child: MessageView(
                  user: users[currentUserSelectedIndex],
                ),
              ),
      ],
    );
  }
}
