import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task6/models/user.dart';
import 'package:task6/provider/userProvider.dart';

class FireBaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUserAndSaveToFirestore({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
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
        return 'success';
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        return e.code;
      } else {
        return 'unknown_error';
      }
    }
    return 'unknown_error';
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
