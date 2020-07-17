import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};
String mainUrl = "https://www.giftoz.in/smartpayer/api/";
class Login extends StatelessWidget {

  bool isLoading = false;

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    isLoading = true;
    print('Name: ${data.name.trim()}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
//      if (!users.containsKey(data.name.trim())) {
//        return 'Username not exists';
//      }
//      if (users[data.name] != data.password) {
//        return 'Password does not match';
//      }

      Map map = {
        'usname': data.name.trim(),
        'pass' : data.password,
      };
      var response = await http.post(mainUrl+"login.php", body: map);
      var jsondata = null;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(response.statusCode == 200)
      {
        jsondata = json.decode(response.body);
        print(jsondata[0]);
        if(jsondata[0]["code"] as String == "login_success")
          {
            prefs?.setBool("isLoggedIn", true);
            prefs?.setString("username", data.name);
            prefs?.setString("f_name", jsondata[0]["f_name"] as String);
            prefs?.setString("l_name", jsondata[0]["l_name"] as String);
            prefs?.setString("mobile", jsondata[0]["mobile"] as String);
            prefs?.setString("address", jsondata[0]["address"] as String);
            prefs?.setString("aadhar", jsondata[0]["aadhar"] as String);
            prefs?.setString("pan", jsondata[0]["pan"] as String);
            prefs?.setString("bal", jsondata[0]["bal"] as String);
            prefs?.setString("total_recharge", jsondata[0]["total_recharge"] as String);
            prefs?.setString("total_transfer", jsondata[0]["total_transfer"] as String);
            prefs?.setString("bill_payment", jsondata[0]["bill_payment"] as String);
            prefs?.setString("total", jsondata[0]["total"] as String);
            return null;
          }
        else
          {
            return "Username and Passwords do not match.";
          }
      }
      else
        {
          return 'Theres an error please try later';
        }
    });
  }
  Future<String> _authUserSign(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return "Sign Up Can be only done by admin, please contact";
    });
  }



  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

//  signIn(String username, password)async {
//    Map data = {
//      'usname': username,
//      'pass' : password,
//    };
//    var response = await http.post("http://localhost:8888/smartpayer/api/login.php", body: data);
//    var jsondata = null;
//    if(response.statusCode == 200)
//    {
//        jsondata = json.decode(response.body);
//        setState((){
//
//        }
//        );
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        title: 'Smart Payer',
        onLogin: _authUser,
        onSignup: _authUserSign,
        onSubmitAnimationCompleted: () {
          Navigator.pushReplacementNamed(context, '/loginhome');
    },
    onRecoverPassword: _recoverPassword,
    );
  }


}
