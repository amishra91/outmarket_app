import 'dart:convert';

import 'package:flutter/material.dart';

class User {
  final String name;
  final String avatarUrl;
  final List<UserMessage> messages;

  User({required this.name, required this.avatarUrl, required this.messages});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        avatarUrl: json['avatarUrl'],
        messages: json['messages'].map<UserMessage>((message) {
          return UserMessage(
            message: message['message'],
            time: DateTime.parse(message['time']),
            isUserMessage: message['isUserMessage'],
          );
        }).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatarUrl': avatarUrl,
      'messages': messages.map((message) {
        return {
          'message': message.message,
          'time': message.time.toIso8601String(),
          'isUserMessage': message.isUserMessage
        };
      }).toList()
    };
  }
}

class UserMessage {
  final String message;
  final DateTime time;
  final bool isUserMessage;

  UserMessage(
      {required this.message, required this.time, this.isUserMessage = false});
}

class MockUserData {
  Future<List<User>> getMockUserList(BuildContext context) async {
    // assets/users.json
    String data = await DefaultAssetBundle.of(context).loadString("users.json");

    List<User> users = <User>[];

    List<dynamic> jsonList = jsonDecode(data);

    for (int i = 0; i < jsonList.length; i++) {
      users.add(User.fromJson(jsonList[i]));
    }
    return users;
  }
}
