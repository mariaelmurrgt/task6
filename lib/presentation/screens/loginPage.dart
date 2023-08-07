import 'package:flutter/material.dart';
import 'package:task6/presentation/shared_widgets/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF9F9F9),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 30, 0),
                    child: Image.asset('assets/icons/xLogo.png'),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(134, 80, 134, 50),
              child: Image.asset('assets/keeLogo.png'),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 45),
              child: Text(
                'You need to login to complete the booking process',
                style: TextStyle(
                  color: Color(0xFF323E48),
                  fontFamily: 'MontserratRegular',
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _errorMessage,
                style: TextStyle(
                  color: Colors.red[300],
                  fontFamily: 'MontserratRegular',
                  fontSize: 12,
                ),
              ),
            ),
            CustomTextField(
              title: 'Email',
              controller: _emailController,
              hintText: 'example@gmail.com',
              isObsucred: false,
            ),
            CustomTextField(
              title: 'Password',
              controller: _passwordController,
              hintText: '********',
              isObsucred: true,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Color(0xFF297BE6),
                        fontFamily: 'MontserratRegular',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_emailController.text.trim().isEmpty) {
                            setState(() {
                              _errorMessage = 'Please enter your email.';
                            });
                          } else if (_passwordController.text.isEmpty) {
                            setState(() {
                              _errorMessage = 'Please enter your password.';
                            });
                          } else {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );

                              Navigator.pushNamed(context, '/loading');
                            } catch (e) {
                              if (e is FirebaseAuthException) {
                                if (e.code == 'invalid-email') {
                                  setState(() {
                                    _errorMessage = 'Invalid email format.';
                                  });
                                } else if (e.code == 'wrong-password') {
                                  setState(() {
                                    _errorMessage = 'Invalid password.';
                                  });
                                } else {
                                  setState(() {
                                    _errorMessage =
                                        'Email or password may be wrong.';
                                  });
                                }
                              }
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF297BE6),
                        ),
                        child: Text(
                          'LOG IN',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'MontserratRegular',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontFamily: 'MontserratRegular',
                      fontSize: 14,
                      color: Color(0xFF323E48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signupmain');
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Color(0xFF297BE6),
                        fontFamily: 'MontserratSemiBold',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
