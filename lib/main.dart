import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myskype/resources/firebase_repository.dart';
import 'package:myskype/screens/homepage.dart';
import 'package:myskype/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final FirebaseRepositories _repositories = FirebaseRepositories();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _repositories.getCurrentUser(),
        builder: (context, AsyncSnapshot<User> futureData) {
          if (futureData.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (futureData.hasData) {
            return const Homepage();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
