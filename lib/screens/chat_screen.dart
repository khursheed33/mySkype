import 'package:flutter/material.dart';
import 'package:myskype/resources/firebase_repository.dart';
import 'package:myskype/utils/utilities.dart';
import 'package:myskype/widgets/chats/chat_list.dart';
import 'package:myskype/widgets/chats/user_avatar.dart';
import 'package:myskype/widgets/custom_app_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

final FirebaseRepositories _repositories = FirebaseRepositories();

class _ChatScreenState extends State<ChatScreen> {
  late String currentUserId;
  late String name;
  bool _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      _repositories.getCurrentUser().then((user) {
        setState(() {
          currentUserId = user.uid;
          name = Utilities.getInitials(user.displayName);
          _isLoading = false;
        });
      });
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Chat:Build():Run");
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : Column(
            children: [
              Container(
                color: Colors.red,
                child: CustomAppBar(
                  key: const ValueKey('customAppBarForChat'),
                  title: UserAvatarWithStatus(
                    name: name,
                    isAdmin: true,
                  ),
                  actions: [
                    Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                  isTitleCenter: true,
                  leading: Icon(
                    Icons.notifications,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9 - 86,
                width: MediaQuery.of(context).size.width,
                // color: Colors.amber,
                child: const ChatListBuilder(),
              ),
            ],
          );
  }
}
