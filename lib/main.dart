import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/presentation/screens/displayPage.dart';
import 'package:task6/presentation/screens/loadingPage.dart';
import 'package:task6/presentation/screens/loginPage.dart';
import 'package:task6/presentation/screens/signupPage.dart';
import 'package:task6/provider/propertyProvider.dart';
import 'package:task6/provider/userProvider.dart';
import 'presentation/screens/home_page_screen.dart';
import 'presentation/screens/signup.dart';
import 'provider/completeProfileProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CompleteProfileProvider>(
          create: (context) => CompleteProfileProvider(),
        ),
        ChangeNotifierProvider<PropertyProvider>(
          create: (context) => PropertyProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/loading',
        routes: {
          '/login': (context) => const LoginPage(),
          '/signupmain': (context) => const SignUpPage(),
          '/signup': (context) => const SignUp(),
          '/display': (context) => const Display(),
          '/home': (context) => const HomePageScreen(),
          '/loading': (context) => const LoadingScreen(),
        },
      ),
    );
  }
}
