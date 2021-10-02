import 'package:flutter/material.dart';

class UserAvatarWithStatus extends StatelessWidget {
  final String? name;
  final bool? isAdmin;
  const UserAvatarWithStatus({
    Key? key,
    @required this.name,
    @required this.isAdmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).primaryColorDark,
            child: Text(
              name!,
              style: TextStyle(
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
          if (isAdmin!)
            const Positioned(
              bottom: 2,
              right: 5,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: Colors.green,
              ),
            ),
          // if (isAdmin == false)
          //   const Positioned(
          //     bottom: 0,
          //     left: 0,
          //     child: CircleAvatar(
          //       radius: 5,
          //       backgroundColor: Colors.green,
          //     ),
          //   ),
        ],
      ),
    );
  }
}
