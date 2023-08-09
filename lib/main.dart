import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/navigation/app_routes.dart';
import 'package:task6/navigation/handle_navigation.dart';
import 'package:task6/presentation/screens/display_page_screen.dart';
import 'package:task6/presentation/screens/loading_page_screen.dart';
import 'package:task6/presentation/screens/login_page_screen.dart';
import 'package:task6/presentation/screens/signup_page_screen.dart';
import 'package:task6/provider/property_provider.dart';
import 'package:task6/provider/user_provider.dart';
import 'presentation/screens/home_page_screen.dart';
import 'presentation/screens/complete_signup_page_screen.dart';
import 'provider/complete_profile_provider.dart';

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
        navigatorKey: HandleNavigation.navigatorKey,
        initialRoute: '/loadingScreen',
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loadingScreenRoute:
      return MaterialPageRoute(builder: (BuildContext context) {
        return LoadingScreen();
      });
    case AppRoutes.homeRoute:
      return MaterialPageRoute(builder: (BuildContext context) {
        return HomePageScreen();
      });

    case AppRoutes.logInRoute:
      return MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      });

    case AppRoutes.singUpMainRoute:
      return MaterialPageRoute(builder: (BuildContext context) {
        return SignUpPage();
      });
    case AppRoutes.singUpRoute:
      return MaterialPageRoute(builder: (BuildContext context) {
        return CompleteSignUp();
      });
    case AppRoutes.displayRoute:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Display();
      });

    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Not Found'),
          ),
          body: Text('Page not found!'),
        );
      });
  }
}
