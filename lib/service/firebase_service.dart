import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task6/models/user.dart';
import 'package:task6/provider/user_provider.dart';

class FireBaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> userLogIn({
    required String email,
    required String password,
  }) async {
    String errorMessage = '';
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e is FirebaseAuthException) {
          if (e.code == 'invalid-email') {
            errorMessage = 'Invalid email format.';
          } else if (e.code == 'wrong-password') {
            errorMessage = 'Invalid password.';
          } else {
            if (email.isEmpty) {
              errorMessage = 'Please enter your email.';
            } else if (password.isEmpty) {
              errorMessage = 'Please enter your password.';
            } else {
              errorMessage = 'Email or password may be wrong.';
            }
          }
        }
      }
    }
    return errorMessage;
  }

  Future<String> createUserAndSaveToFirestore({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    String errorMessage = '';
    if (password.length < 8 && !password.contains(RegExp(r'[A-Z]'))) {
      errorMessage =
          'Password should contain 8 characters and at least 1 uppercase letter.';
      return errorMessage;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        UserModel userModel = UserModel(
          email: email,
          firstName: firstName,
          lastName: lastName,
          userId: user.uid,
        );
        await _firestore
            .collection('users')
            .doc(user.uid)
            .set(userModel.toJson());
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-email') {
          errorMessage = 'Invalid email format.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Invalid password.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'Email already exits.';
        } else {
          if (email.isEmpty) {
            errorMessage = 'Please enter your email.';
          } else if (password.isEmpty) {
            errorMessage = 'Please enter your password.';
          } else {
            errorMessage = 'Something went wrong.';
          }
        }
      }
    }
    return errorMessage;
  }

  Future<UserModel?> checkLoggedInUserAndFetchData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      print('User not null');
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }
}
