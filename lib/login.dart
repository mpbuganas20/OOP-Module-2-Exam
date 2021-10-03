import 'package:bankingapp/dashboard_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Account Login",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(0xffF0A500),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Welcome to Easy Bank",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  hintText: 'Username',
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                  fillColor: Color(0xFF334756),
                  filled: true,
                  focusColor: Colors.white,
                ),
                style: TextStyle(color: Colors.white),
              ),
              Padding(padding: EdgeInsets.all(3)),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                  fillColor: Color(0xFF334756),
                  filled: true,
                ),
                style: TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        Text(
                          'Not Registered Yet?',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Create an Account',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    var url = "https://www.google.com.ph";
                                  }),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFF0A500),
                          minimumSize: Size(124, 57),
                          padding: EdgeInsets.all(20),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          textStyle: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
