import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool? isTitleCenter;
  final Widget? leading;

  const CustomAppBar({
    required Key key,
    @required this.title,
    @required this.actions,
    @required this.isTitleCenter,
    @required this.leading,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).disabledColor,
            width: 1.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0.0,
        title: title,
        leading: leading,
        centerTitle: isTitleCenter,
        actions: actions,
      ),
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 10);

  // @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
