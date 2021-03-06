import 'dashboard_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
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
                      height: MediaQuery.of(context).size.height / 3 + 80,
                    ),
                    Form(
                      key: formGlobalKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) => value == "admin" ? null : '',
                            decoration: InputDecoration(
                              errorStyle: TextStyle(height: 0),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: TextFormField(
                              validator: (value) =>
                                  value == "admin" ? null : '',
                              obscureText: true,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(height: 0),
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
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column(
                            children: [
                              Text(
                                'Not Registered Yet?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Create an Account',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Under Construction')));
                                      },
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            onPressed: () {
                              if (formGlobalKey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DashboardScreen()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Error')));
                              }
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
          ),
        ),
      ),
    );
  }
}
