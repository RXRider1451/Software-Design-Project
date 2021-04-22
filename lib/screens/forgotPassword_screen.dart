import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sd_health_science_app/screens/signin.dart';
import 'package:fluttertoast/fluttertoast.dart';

class forgotPasswordScreen extends StatefulWidget {
  @override
  _forgotPasswordScreenState createState() => _forgotPasswordScreenState();
}

class _forgotPasswordScreenState extends State<forgotPasswordScreen> {
  final _usernameController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(children: [
              Expanded(
                flex: 2,
                child: Icon(
                  Icons.lock,
                  size: 200,
                  color: Colors.white,
                ),
              ),
              Flexible(
                child: Text(
                  'Forgot Password',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    controller: _usernameController,

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
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        hintText: "username",
                        fillColor: Colors.white),
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
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextButton(
                      child: Text('Sign in',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ))),
                      onPressed: () async {
                        // if (_formkey.currentState.validate()) {
                        //   Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => SignInScreen()));
                        // }
                        bool validate = true;
                        if (_usernameController.text == null) {}
                      }),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
