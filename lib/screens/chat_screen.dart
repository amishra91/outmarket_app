import 'package:flutter/material.dart';
import 'package:outmarket_app/colors.dart';
import 'package:outmarket_app/models/message_data.dart';
import 'package:outmarket_app/widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  List<UserMessage> messages = <UserMessage>[];
  ScrollController controller = ScrollController();

  ChatScreen({super.key, required this.messages, required this.controller});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        color: AppColors.accent,
        padding: const EdgeInsets.only(right: 70, left: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                    controller: widget.controller,
                    reverse: true,
                    itemCount: widget.messages.length,
                    itemBuilder: (context, index) {
                      return MessageBubble(
                        userMessage: widget.messages[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
