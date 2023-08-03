import 'package:flutter/material.dart';
import 'package:task6/presentation/shared_widgets/globalButton.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.istockphoto.com/id/1337144146/sv/vektor/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=GXVOqN9-6nUrgmK2thaQuTtf1bpxUMCEUvNlun-uX7g='),
                radius: 40,
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
        ],
      ),
    );
  }
}
