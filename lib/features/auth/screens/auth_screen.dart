import 'package:amazon_clone_tutorial/common/widgets/custom_button.dart';
import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_textfield.dart';
import '../services/auth_serivces.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Navigator.push(context, route)
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome ",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: "Name",
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomButton(
                            text: "Sign Up",
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: Text(
                  "Sign-In",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        // CustomTextField(
                        //   controller: _nameController,
                        //   hintText: "Name",
                        // ),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomButton(
                            text: "Sign In",
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                signInUser();
                              }
                            })
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
