import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:myskype/widgets/chats/user_avatar.dart';

class UserChatTile extends StatelessWidget {
  const UserChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            debugPrint("Pressed");
          },
          leading: const UserAvatarWithStatus(name: "CS", isAdmin: false),
          title: const Text(
            "Khursheed",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: const Text("Hello bro"),
          // trailing: ,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            alignment: Alignment.centerRight,
            height: 1,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Theme.of(context).disabledColor.withOpacity(0.2),
            ),
          ),
        )
      ],
    );
  }
}
