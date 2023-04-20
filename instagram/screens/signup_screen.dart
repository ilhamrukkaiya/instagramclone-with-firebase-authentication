import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instlogin/Screen/login_screen.dart';
import 'package:instlogin/resoures/auth_method.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController namecolr = TextEditingController();
  TextEditingController emailcolr = TextEditingController();

  TextEditingController passwdlcolr = TextEditingController();
  bool _isloading = false;

  var _name, _email, _password;
  _sumbit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_email);
      print(_password);
      print(_name);
    }
    Signupuser();
  }

  Signupuser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethod().SignUpuser(
        name: namecolr.text, email: emailcolr.text, password: passwdlcolr.text);
    print(res);
    if (res != "susses") {
      showSnackBar(res, context);
    } else if (res == "succes") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                        hintText: "Enter your Name",
                        labelText: "Name",
                      ),
                      controller: namecolr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          "Name is not to empty";
                        }
                      },
                      onSaved: (newValue) => _name = newValue,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your Email id",
                        labelText: "Email",
                      ),
                      controller: emailcolr,
                      validator: (value) {
                        if (value != null) {
                          value.contains("@")
                              ? "please enter a valid email"
                              : "";
                        }
                      },
                      onSaved: (newValue) => _email = newValue,
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
                      controller: passwdlcolr,
                      obscureText: true,
                      validator: (value) => value!.length < 6
                          ? "Must be at least 6 character"
                          : null,
                      onSaved: (newValue) => _password = newValue,
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
                                "Sign up",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                      ))
                ],
              )),
        ],
      )),
    );
  }
}
