import 'package:firebase_auth/firebase_auth.dart';
import 'package:myskype/resources/firebase_methods.dart';

class FirebaseRepositories {
  final FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<User> getCurrentUser() => _firebaseMethods.getCurrentUser();

  Future<User> signIn() => _firebaseMethods.signIn();

  Future<bool> authenticateUser(User user) =>
      _firebaseMethods.authenticateUser(user);

  Future<void> addDataToDB(User user) => _firebaseMethods.addDataToDB(user);
}
