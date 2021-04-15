import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:sd_health_science_app/screens/home_screen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Lottie.asset(
                      'assets/lottie/doctor.json',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Wits Health App',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            //textAlign: TextAlign.center,
                            cursorColor: Colors.black,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                //labelText: 'Username',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[600]),
                                hintText: "username",
                                fillColor: Colors.white70),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.bottom,
                                //textAlign: TextAlign.center,
                                cursorColor: Colors.black,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                    // labelText: 'Password',
                                    prefixIcon: Icon(
                                      Icons.vpn_key,
                                      color: Colors.black,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[600]),
                                    hintText: "password",
                                    fillColor: Colors.white70),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Forgot Password?',
                                style: TextStyle(color: Colors.lightBlue)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: TextButton(
                              child: Text('Sign in',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
