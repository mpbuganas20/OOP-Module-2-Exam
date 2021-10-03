import 'package:flutter/material.dart';
import 'login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Effortless.\nStraightforward. ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 36,
                    color: Color(0xffF0A500),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "With a straightforward\nand wonderful way to\nmanage your banking\nneeds.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Welcome.jpg"))),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF0A500),
                  minimumSize: Size(279, 40),
                  padding: EdgeInsets.all(10),
                  onPrimary: Color(0xFF000000),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
            ]),
      ),
    ));
  }
}
