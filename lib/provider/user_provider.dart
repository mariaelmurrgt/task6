import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task6/models/user.dart';
import 'package:task6/navigation/handle_navigation.dart';
import 'package:task6/presentation/shared_widgets/snackbar.dart';
import 'package:task6/service/firebase_service.dart';

class UserProvider with ChangeNotifier {
  final FireBaseService _firestoreService = FireBaseService();

  UserModel? _user;
  bool _isLoading = false;
  String _errorMessage = '';

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  set errorMessage(String newErrorMessage) {
    _errorMessage = newErrorMessage;
    notifyListeners();
  }

  void setUser(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  _checkUser() async {
    UserModel? loggedInUser =
        await _firestoreService.checkLoggedInUserAndFetchData();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (loggedInUser != null) {
        setUser(loggedInUser);
      }
    });
  }

  Future<void> checkUserLoading() async {
    await _checkUser();
    HandleNavigation.pushNamedAndRemoveUntil('/home', (p0) => false);
    notifyListeners();
  }

  void handleLogin(BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    FocusScope.of(context).unfocus();
    String error = await _firestoreService.userLogIn(
      email: email,
      password: password,
    );
    _errorMessage = error;
    if (_errorMessage == '') {
      await _checkUser();
      HandleNavigation.popUntilFirst();
    } else {
      GlobalSnackbar.showError(context, _errorMessage);
    }

    _isLoading = false;
    notifyListeners();
  }

  void handleSignUp(BuildContext context, String email, String password,
      String firstName, String lastName) async {
    _isLoading = true;
    notifyListeners();

    FocusScope.of(context).unfocus();

    String error = await _firestoreService.createUserAndSaveToFirestore(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );

    _errorMessage = error;

    if (_errorMessage == '') {
      await _checkUser();
      HandleNavigation.popUntilFirst();
    } else {
      GlobalSnackbar.showError(context, _errorMessage);
    }

    _isLoading = false;
    notifyListeners();
  }

  void handleLogOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    setUser(null);
    Scaffold.of(context).openEndDrawer();
  }
}
