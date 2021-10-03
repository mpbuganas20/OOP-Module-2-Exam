import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.person),
                  iconSize: 56,
                  color: Colors.white,
                  splashRadius: 30,
                  onPressed: () {},
                ),
                SizedBox(width: 5),
                Text(
                  "Hello, John",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: Color(0xFFFFFFFF)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text("Under Construction"),
                      action: SnackBarAction(
                        label: "Undo",
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF334756),
                    minimumSize: Size(362, 180),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("John Jones",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Color(0xFFFFFFFF))),
                          SizedBox(width: 180),
                          Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 40,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "**** **** 1234",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Color(0xFFFFFFFF),
                              letterSpacing: 13),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Balance",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18)),
                                Text(
                                  "PHP 100,000",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                      color: Color(0xFFF0A501)),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 120,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, right: 3),
                            child: Text(
                              "06/24",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 18),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
