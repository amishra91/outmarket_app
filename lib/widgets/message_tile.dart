import 'package:flutter/material.dart';
import 'package:outmarket_app/colors.dart';
import 'package:outmarket_app/models/models.dart';
import 'package:outmarket_app/widgets/widgets.dart';

class MessageTile extends StatelessWidget {
  final bool isActive;
  final User user;
  const MessageTile({
    super.key,
    required this.isActive,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 24, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: isActive ? AppColors.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Visibility(
            visible: isActive ? false : true,
            child: Container(
              height: 0.5,
              color: AppColors.dark,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Avatar(
                url: user.avatarUrl,
                radius: 22,
              ),
              Container(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.dark),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        user.messages.first.message.length > 30
                            ? '${user.messages.first.message.substring(0, 30)}...'
                            : user.messages.first.message,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(
                            0x76767CCC,
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '1m Ago',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0x76767CCC)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Icon(
                        Icons.done_all,
                        size: 18,
                        color: Color(0xFF3469F9),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // const Row(
    //   children: [
    //     Avatar(
    //         url:
    //             'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png',
    //         radius: 22)
    //   ],
    // );
  }
}
