import 'transfer_money_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/user_transactions.dart';
import '/user_data.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final account = Accounts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width),
          child: Column(children: [
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
                  "Welcome, " + account.firstName,
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
                    print(Accounts().accountBalance.toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Under Construction')));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF334756),
                    minimumSize: Size(362, 180),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45))),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(account.firstName + " " + account.lastName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Color(0xFFFFFFFF))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 3),
                          Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 40,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(account.accountNumber,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Color(0xFFFFFFFF),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  "PHP " + account.accountBalance.toString(),
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
                            width: MediaQuery.of(context).size.width / 5,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20, right: 3),
                            child: Text(
                              account.expDate,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 18),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0B2C44),
                            minimumSize: Size(130, 35),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Add Card",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18)),
                              Icon(Icons.add)
                            ],
                          )),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          navigateSecondPage();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFF0A500),
                          minimumSize: Size(79, 33),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        child: Text("Transfer")),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF0A500),
                            minimumSize: Size(79, 33),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          child: Text("Deposit")),
                    )
                  ],
                )),
            SizedBox(height: MediaQuery.of(context).size.height / 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Transactions",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white),
                ),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'View All',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Under Construction')));
                      },
                  ),
                  TextSpan(text: ">")
                ]))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Card(
                  color: Color(0xFF0B2C44),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(26))),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 10),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    spreadRadius: -1,
                                    blurRadius: 7,
                                    offset: Offset(0, 0)),
                                BoxShadow(
                                  color: Color(0xFF0B2C44),
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ], borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 5),
                                          Text(
                                            transactions[index].type,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18,
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                          Text(
                                            transactions[index].date,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 14,
                                                color: Color(0xFFFFFFFF)),
                                          )
                                        ]),
                                    Text(
                                      "+ PHP " +
                                          transactions[index].amount.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Color(0xFFF0A501)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void refreshData() {
    account.accountBalance;
  }

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateSecondPage() {
    Route route = MaterialPageRoute(
        builder: (context) => TransactionScreen(account: account));
    Navigator.push(context, route).then(onGoBack);
  }
}
