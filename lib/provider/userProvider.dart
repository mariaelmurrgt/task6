import 'package:flutter/material.dart';
import 'package:task6/models/user.dart';
import 'package:task6/navigation/handle_navigation.dart';
import 'package:task6/service/firebase_service.dart';

class UserProvider with ChangeNotifier {
  final FireBaseService _firestoreService = FireBaseService();

  UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  checkUser() async {
    print('check user');
    UserModel? loggedInUser =
        await _firestoreService.checkLoggedInUserAndFetchData();
    print('${loggedInUser}');
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // This callback runs after the widget is built
      if (loggedInUser != null) {
        setUser(loggedInUser!);
      }
    });
  }

  Future<void> checkUserLoading() async {
    await checkUser();
    HandleNavigation.pushNamedAndRemoveUntil('/home', (p0) => false);
  }

  Future<void> checkUserLogInSignUp() async {
    await checkUser();
    HandleNavigation.popUntilFirst();
  }
}
