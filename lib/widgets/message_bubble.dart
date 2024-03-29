import 'package:flutter/material.dart';
import 'package:outmarket_app/helpers.dart';
import 'package:outmarket_app/models/message_data.dart';

class MessageBubble extends StatelessWidget {
  final UserMessage userMessage;
  const MessageBubble({super.key, required this.userMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: userMessage.isUserMessage
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                decoration: BoxDecoration(
                  color: userMessage.isUserMessage
                      ? const Color(0xFF000929)
                      : const Color(0xFF2E3B5B),
                  borderRadius: userMessage.isUserMessage
                      ? const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  userMessage.message,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: userMessage.isUserMessage
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: 4,
                left: userMessage.isUserMessage ? 8 : 0,
                right: userMessage.isUserMessage ? 0 : 8,
              ),
              child: Text(
                Helpers.getTimeDate(userMessage.time),
                textAlign: userMessage.isUserMessage
                    ? TextAlign.right
                    : TextAlign.left,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFA1A4B2),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
