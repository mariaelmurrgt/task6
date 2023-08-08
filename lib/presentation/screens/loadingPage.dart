import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/models/user.dart';
import 'package:task6/navigation/handle_navigation.dart';
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
    Provider.of<UserProvider>(context, listen: false).checkUserLoading();
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
