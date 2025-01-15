import 'package:flutter/material.dart';
import 'package:flutter_carrot_app/carrot_market_ui_05/models/chat_message.dart';
import 'package:flutter_carrot_app/carrot_market_ui_05/screens/chatting/components/chat_container.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // 위젯 만들어서 2개 내려줄 생각
        ChatContainer(
          chatMessage: chatMessageList[0],
        ),
      ],
    );
  }
}
