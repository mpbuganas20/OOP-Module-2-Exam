import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff082032),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 85, horizontal: 25),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Account Login",
                  style: TextStyle(
                    fontSize: 38,
                    color: Color(0xffF0A500),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Welcome to Easy Bank",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 400,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.white),
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
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Color(0xFF334756),
                  filled: true,
                ),
                style: TextStyle(color: Colors.white),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Not Registered Yet?',
                        style: TextStyle(color: Colors.white),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Create an Account',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  var url = "https://www.google.com.ph";
                                }),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      print('Logged In');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFFF0A500),
                        minimumSize: Size(150, 10),
                        padding: EdgeInsets.all(20),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        textStyle: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
