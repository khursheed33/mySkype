import 'package:flutter/material.dart';
import 'package:myskype/widgets/chats/user_chat_tile.dart';

class ChatListBuilder extends StatelessWidget {
  const ChatListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          child: const UserChatTile(),
        );
      },
    );
  }
}
