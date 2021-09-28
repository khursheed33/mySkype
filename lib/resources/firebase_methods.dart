import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myskype/models/user.dart';
import 'package:myskype/utils/utilities.dart';

class FirebaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  Future<User> getCurrentUser() async {
    User _user;
    _user = _auth.currentUser!;
    return _user;
  }

  Future<User> signIn() async {
    UserCredential? _user;
    try {
      GoogleSignInAccount? _gAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication _gAuth = await _gAccount!.authentication;
      AuthCredential _gAuthCredential = GoogleAuthProvider.credential(
        accessToken: _gAuth.accessToken,
        idToken: _gAuth.idToken,
      );

      _user = await _auth.signInWithCredential(_gAuthCredential);
      return _user.user!;
    } catch (err) {
      debugPrint("There is an error: $err");
      return _user!.user!;
    }
  }

  Future<bool> authenticateUser(User user) async {
    QuerySnapshot _user = await _firebaseFirestore
        .collection('users')
        .where('email', isEqualTo: user.email)
        .get();

    final List<QueryDocumentSnapshot> _docs = _user.docs;
    return _docs.isEmpty ? true : false;
  }

  Future<void> addDataToDB(User user) async {
    final _username = Utilities.getUserName(user.email!);
    _firebaseFirestore.collection('users').doc(user.uid).set(
          UserModel().userFromModelToJSON(
            UserModel(
              name: user.displayName,
              username: _username,
              email: user.email,
              profileImage: user.photoURL,
              state: null,
              status: null,
              uid: user.uid,
            ),
          ),
        );
  }
}
