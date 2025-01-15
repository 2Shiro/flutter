import 'package:flutter/material.dart';
import 'package:flutter_carrot_app/carrot_market_ui_05/models/chat_message.dart';
import 'package:flutter_carrot_app/carrot_market_ui_05/screens/components/image_container.dart';

class ChatContainer extends StatelessWidget {
  final ChatMessage chatMessage;

  const ChatContainer({
    required this.chatMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          ImageContainer(
            borderRadius: 25,
            imageUrl: chatMessage.profileImage,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
