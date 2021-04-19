import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:sd_health_science_app/screens/home_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
        child: Form(
          key: _formkey,
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
                            child: TextFormField(
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
                              //Validation for Username
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a username';
                                } else if (value.length > 15) {
                                  return "Username should not be greater than 15 characters";
                                }
                                return null;
                              },
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: TextFormField(
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
                                    //Validation for Password
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Please enter a password";
                                      } else if (value.length < 6) {
                                        return "Password should be at least 6 characters";
                                      } else if (value.length > 15) {
                                        return "Password should not be greater than 15 characters";
                                      }
                                      return null;
                                    }),
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
                                  if (_formkey.currentState.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  }
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
      ),
    );
  }
}
