import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/navigation/handle_navigation.dart';
import 'package:task6/presentation/shared_widgets/global_loading.dart';
import 'package:task6/presentation/shared_widgets/global_textfield.dart';
import 'package:task6/provider/user_provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, currentUserProvider, _) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              color: Color(0xFFF9F9F9),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 80, 10, 40),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                HandleNavigation.pop();
                                //Navigator.pop(context);
                              },
                              child: Image.asset(
                                'assets/icons/backArrow.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                            SizedBox(
                              width: 125,
                            ),
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xFF323E48),
                                fontFamily: 'MontserratMedium',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        title: 'Email',
                        controller: _emailController,
                        hintText: 'example@gmail.com',
                      ),
                      CustomTextField(
                        title: 'First Name',
                        controller: _firstNameController,
                        hintText: 'John',
                      ),
                      CustomTextField(
                        title: 'Last Name',
                        controller: _lastNameController,
                        hintText: 'Doe',
                      ),
                      CustomTextFieldPassword(
                        title: 'Password',
                        controller: _passwordController,
                        hintText: '********',
                        isObscured: true,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'Password should contain at least 1 letter uppercase and a total of 8 characters.',
                                  style: TextStyle(
                                    fontFamily: 'MontserratRegular',
                                    fontSize: 10,
                                    color: Color(0xFF323E48),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 45, 20, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    currentUserProvider.handleSignUp(
                                        context,
                                        _emailController.text.trim(),
                                        _passwordController.text.trim(),
                                        _firstNameController.text,
                                        _lastNameController.text);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF297BE6),
                                  ),
                                  child: Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'MontserratMedium',
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
            currentUserProvider.isLoading
                ? CustomLoadingWidget()
                : SizedBox.shrink(),
          ],
        ),
      );
    });
  }
}
