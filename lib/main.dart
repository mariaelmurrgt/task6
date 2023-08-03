import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/presentation/screens/displayPage.dart';
import 'package:task6/presentation/screens/loginPage.dart';
import 'package:task6/presentation/screens/signupPage.dart';
import 'package:task6/provider/propertyProvider.dart';
import 'presentation/screens/home_page_screen.dart';
import 'presentation/screens/signup.dart';
import 'provider/completeProfileProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CompleteProfileProvider>(
          create: (context) => CompleteProfileProvider(),
        ),
        ChangeNotifierProvider<PropertyProvider>(
          create: (context) => PropertyProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/home',
        routes: {
          '/login': (context) => const LoginPage(),
          '/signupmain': (context) => const SignUpPage(),
          '/signup': (context) => const SignUp(),
          '/display': (context) => const Display(),
          '/home': (context) => const HomePageScreen(),
        },
      ),
    ),
  );
}
