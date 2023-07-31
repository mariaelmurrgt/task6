import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/presentation/screens/displayPage.dart';
import 'presentation/screens/signup.dart';
import 'provider/completeProfileProvider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => CompleteProfileProvider(),
      child: MaterialApp(
        initialRoute: '/signup',
        routes: {
          '/signup': (context) => const SignUp(),
          '/display': (context) => const Display(),
        },
      ),
    ));
