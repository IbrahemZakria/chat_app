import 'package:chat_app/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatBubel {
  static Widget chatBubelSender({
    required String message,
    Color color = kprimaryColor,
    Alignment alignment = Alignment.topRight,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ChatBubble(
        clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
        alignment: Alignment.topRight,
        backGroundColor: color,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 200),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  static Widget chatBubelReciver({
    required String message,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ChatBubble(
        clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
        alignment: Alignment.topLeft,
        backGroundColor: color,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 200),
          child: Text(
            message,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
