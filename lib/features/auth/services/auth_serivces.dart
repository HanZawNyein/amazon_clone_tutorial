import 'dart:convert';

import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:amazon_clone_tutorial/constants/utils.dart';
import 'package:amazon_clone_tutorial/features/home/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/error_handling.dart';
import '../../../models/user.dart';
import 'package:http/http.dart' as http;

import '../../../provider/user_provider.dart';

class AuthService {
  //  sign up user
  Future<void> signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          });
      print(res.statusCode);
      // print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account Created.');
          });
    } catch (e) {
      // print("&**");
      // print(e);
      // print(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  //  sign in user
  Future<void> signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({"email": email, "password": password}),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          });
      // print(res.statusCode);
      // print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.routeName,
              (route) => false,
            );
          });
    } catch (e) {
      // print("&**");
      // print(e);
      // print(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  //  get user data
  Future<void> getUserData({required BuildContext context}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes=await http.post(Uri.parse('$uri/tokenIsValid'), headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
        "x-auth-token": token!,
      });

      var response = jsonDecode(tokenRes.body);
      if(response==true){

      }


      // http.Response res = await http.post(Uri.parse('$uri/api/signin'),
      //     // body: jsonEncode({"email": email, "password": password}),
      //     headers: <String, String>{
      //       "Content-Type": "application/json; charset=UTF-8",
      //     });
      // print(res.statusCode);
      // print(res.body);
      // httpErrorHandle(
      //     response: res,
      //     context: context,
      //     onSuccess: () async {
      //       final SharedPreferences prefs = await SharedPreferences.getInstance();
      //       await prefs.setString(
      //           'x-auth-token', jsonDecode(res.body)['token']);
      //       Provider.of<UserProvider>(context, listen: false).setUser(res.body);
      //       Navigator.pushNamedAndRemoveUntil(
      //         context,
      //         HomeScreen.routeName,
      //             (route) => false,
      //       );
      //     });
    } catch (e) {
      // print("&**");
      // print(e);
      // print(e.toString());
      showSnackBar(context, e.toString());
    }
  }
}
