import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/models/user.dart';
import 'package:task6/provider/userProvider.dart';
import 'package:task6/service/firebase_service.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final FireBaseService _firestoreService = FireBaseService();
  @override
  void initState() {
    super.initState();
    print('init loading');
    checkUser();
  }

  Future<void> checkUser() async {
    print('check user');
    UserModel? loggedInUser =
        await _firestoreService.checkLoggedInUserAndFetchData();
    print('${loggedInUser}');
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // This callback runs after the widget is built
      if (loggedInUser != null) {
        Provider.of<UserProvider>(context, listen: false)
            .setUser(loggedInUser!);
      }
    });
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/keeLogo.png'),
      ),
    );
  }
}
