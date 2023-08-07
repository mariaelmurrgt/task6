import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/presentation/shared_widgets/globalButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task6/provider/userProvider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF323E48),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/id/1337144146/sv/vektor/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=GXVOqN9-6nUrgmK2thaQuTtf1bpxUMCEUvNlun-uX7g='),
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${userProvider.user?.firstName ?? ''} ${userProvider.user?.lastName ?? ''}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'MontserratSemiBold',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: GlobalButton(
              title: 'Your Profile',
              color: Color(0xFFB2BBCA),
              onPressed: () {},
              width: 200,
              height: 50,
            ),
          ),
          if (userProvider.user == null)
            Container(
              margin: EdgeInsets.all(10),
              child: GlobalButton(
                title: 'Log In',
                color: Color(0xFFB2BBCA),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                width: 200,
                height: 50,
              ),
            ),
          if (userProvider.user != null)
            Container(
              margin: EdgeInsets.all(10),
              child: GlobalButton(
                title: 'Log Out',
                color: Color(0xFFB2BBCA),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Provider.of<UserProvider>(context, listen: false)
                      .setUser(null);
                  Navigator.pop(context);
                },
                width: 200,
                height: 50,
              ),
            ),
        ],
      ),
    );
  }
}
