import 'package:flutter/material.dart';
import 'package:myskype/screens/chat_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // final FirebaseRepositories _repositories = FirebaseRepositories();
  // bool _isSingingOut = false;
  final List _pages = const [
    Center(
      child: ChatScreen(),
    ),
    Center(
      child: Text("Call Logs"),
    ),
    Center(child: Text("Contacts")),
  ];
  int? _currentIndex = 0;
  void updateIndex(int? index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex!],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) => updateIndex(val),
        currentIndex: _currentIndex!,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
              ),
              label: "Call"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.contact_page,
              ),
              label: "Contact"),
        ],
      ),
    );
  }
}
