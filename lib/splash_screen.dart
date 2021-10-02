import 'package:bankingapp/login.dart';
import 'package:bankingapp/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff082032),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              Container(
                  height: 300,
                  width: 300,
                  //color: Colors.blueGrey,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/Easy_Bank_Logo_4.png'),
                    fit: BoxFit.fill,
                  ))),
              SizedBox(
                height: 225,
              ),
              Container(
                  child: Text('Easy Bank',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF0A500)))),
              Positioned(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Text(
                        '© 2021-2022 All Rights Reserved',
                        style: TextStyle(color: Colors.white),
                      ))),
            ],
          ),
        ));
  }
}
