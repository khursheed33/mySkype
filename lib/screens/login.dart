import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myskype/resources/firebase_repository.dart';
import 'package:myskype/screens/homepage.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final FirebaseRepositories _repositories = FirebaseRepositories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: MediaQuery.of(context).size.width * 0.7,
          color: Colors.white,
          child: ElevatedButton(
            onPressed: () => performUserLogin(context),
            child: const Center(
              child: Text("Login with Google"),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> performUserLogin(BuildContext context) async {
    _repositories.signIn().then((User user) {
      debugPrint("Got User:::::");
      authenticateUser(user, context);
    });
  }

  void authenticateUser(User user, BuildContext context) {
    _repositories.authenticateUser(user).then((bool isNewUser) {
      if (isNewUser) {
        debugPrint("Registering User:::::");

        // Register the user
        _repositories.addDataToDB(user).then((value) {
          debugPrint("Registerd User:::::");

          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => const Homepage(),
            ),
          );
        });
      } else {
        debugPrint("Login in User:::::");

        // Login the user
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) => const Homepage(),
          ),
        );
      }
    });
  }
}
