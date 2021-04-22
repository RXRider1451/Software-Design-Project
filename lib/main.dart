import 'package:flutter/material.dart';
import 'package:sd_health_science_app/screens/home_screen.dart';
import 'package:sd_health_science_app/screens/signin.dart';
import 'package:sd_health_science_app/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Auth(),
    );
  }
}
