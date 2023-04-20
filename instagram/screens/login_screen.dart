import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instlogin/Screen/home_screen.dart';
import 'package:instlogin/resoures/auth_method.dart';
import 'package:instlogin/Screen/signup_screen.dart';
import 'package:instlogin/pages/homepage.dart';
import 'package:instlogin/widgets/forgetpassword.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _email, _password;

  TextEditingController emailcolr = TextEditingController();
  TextEditingController passwdlcolr = TextEditingController();
  bool _isloading = false;
  @override
  void dispose() {
    super.dispose();
    emailcolr.dispose();
    passwdlcolr.dispose();
  }

  _sumbit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    loginuser();
  }

  loginuser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethod().Loginuser(
      email: emailcolr.text,
      password: passwdlcolr.text,
    );
    if (res == "sucess") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String _email, _password;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Instagram",
              style: TextStyle(fontFamily: "Billabong", fontSize: 50.0),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your Email id",
                          labelText: "Email",
                        ),
                        validator: (value) {
                          if (value != null) {
                            value.contains("@")
                                ? "please enter a valid email"
                                : "";
                          }
                        },
                        onSaved: (newValue) => _email = newValue!,
                        controller: emailcolr,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your password",
                          labelText: "Password",
                        ),
                        validator: (value) => value!.length < 6
                            ? "Must be at least 6 character"
                            : null,
                        onSaved: (newValue) => _password = newValue!,
                        controller: passwdlcolr,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        width: 250.0,
                        child: TextButton(
                          onPressed: _sumbit,
                          child: _isloading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue),
                        ))
                  ],
                )),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPassword()));
                      },
                      child: Text("forgot your password ?,")),
                ),
                Text(
                  "Get help logging in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                    child: Divider(
                  thickness: 2,
                )),
                Text(" OR "),
                Flexible(
                    child: Divider(
                  thickness: 2,
                )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login with FaceBook",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("don't have an account ?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        )),
      ),
    );
  }
}
