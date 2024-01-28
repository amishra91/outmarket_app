import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outmarket_app/colors.dart';
import 'package:outmarket_app/models/message_data.dart';
import 'package:outmarket_app/screens/chat_screen.dart';
import 'package:outmarket_app/size_utils.dart';
import 'package:outmarket_app/widgets/widgets.dart';

class MessageView extends StatefulWidget {
  User user;

  MessageView({
    super.key,
    required this.user,
  });

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void sendNewMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        widget.user.messages.add(
          UserMessage(
            message: _controller.text,
            time: DateTime.now(),
            isUserMessage: false,
          ),
        );
        widget.user = widget.user;
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Avatar(url: widget.user.avatarUrl, radius: 30),
                  Container(
                      padding: const EdgeInsets.only(
                        left: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.user.name,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.dark),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color(0xFF33B843),
                                size: 8,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text('Online',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ))
                            ],
                          )
                        ],
                      )),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(right: 70),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Iconsax.video),
                    SizedBox(
                      width: 24,
                    ),
                    Icon(Iconsax.call),
                    SizedBox(
                      width: 24,
                    ),
                    Icon(Iconsax.category),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: ChatScreen(
              messages: widget.user.messages.reversed.toList(),
              controller: _scrollController,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 75.h,
            child: Material(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 26.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Iconsax.category),
                      Expanded(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 50.0,
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                margin:
                                    const EdgeInsets.only(left: 12, right: 10),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: AppColors.accent,
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: TextField(
                                  controller: _controller,
                                  decoration: const InputDecoration(
                                    hintText: 'Type a message',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                      right: 80,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(Iconsax.attach_circle),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      sendNewMessage();
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF2E3B5B),
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: const Icon(
                                        Iconsax.send_21,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
