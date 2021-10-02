import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myskype/progressIndicator/login_progress.dart';
import 'package:myskype/resources/firebase_repository.dart';
import 'package:myskype/screens/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseRepositories _repositories = FirebaseRepositories();
  bool _isLoggingIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoggingIn
            ? const LoginShimmerProgress(title: "Logging in...")
            : SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () => performUserLogin(context),
                  child: const Center(
                    child: Text(
                      "Login with Google",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Future<void> performUserLogin(BuildContext context) async {
    setState(() {
      _isLoggingIn = true;
    });
    _repositories.signIn().then((User user) {
      authenticateUser(user, context);
    });
  }

  void authenticateUser(User user, BuildContext context) {
    _repositories.authenticateUser(user).then((bool isNewUser) {
      setState(() {
        _isLoggingIn = false;
      });
      if (isNewUser) {
        // Register the user
        _repositories.addDataToDB(user).then((value) {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => const Homepage(),
            ),
          );
        });
      } else {
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
