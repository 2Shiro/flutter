import 'package:flutter/material.dart';
import 'package:flutter_carrot_app/carrot_market_ui_05/models/chat_message.dart';
import 'package:flutter_carrot_app/carrot_market_ui_05/screens/chatting/components/chat_container.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        chatMessageList.length,
        (index) => ChatContainer(chatMessage: chatMessageList[index]),
      ),
    );
  }
}
