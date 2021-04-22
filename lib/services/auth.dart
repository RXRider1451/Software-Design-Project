import 'package:flutter/material.dart';
import 'package:sd_health_science_app/screens/home_screen.dart';
import 'package:sd_health_science_app/screens/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void initState() {
    getData();
  }

  String username = "";

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String usr;
    setState(() {
      usr = prefs.getString('username');
    });
    if (usr == null) {
      username = "";
    } else {
      username = usr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: username == "" ? SignInScreen() : HomeScreen());
  }
}
