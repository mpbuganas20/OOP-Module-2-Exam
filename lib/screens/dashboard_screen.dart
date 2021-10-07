import 'package:intl/intl.dart';

import 'transfer_money_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/models/user_data.dart';
import '/models/user_transactions.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final account = Accounts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Under Construction')));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF334756),
                      minimumSize: Size(362, 180),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(45))),
                      elevation: 5,
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
                                    "PHP " +
                                        NumberFormat('###,000.00')
                                            .format(account.accountBalance),
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
                              width: MediaQuery.of(context).size.width / 10,
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
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Under Construction')));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0B2C44),
                              minimumSize: Size(130, 35),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              elevation: 5,
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
                            navigateNextPage();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF0A500),
                            minimumSize: Size(79, 33),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            elevation: 5,
                          ),
                          child: Text("Transfer")),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Under Construction')));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFF0A500),
                              minimumSize: Size(79, 33),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              elevation: 5,
                            ),
                            child: Text("Deposit")),
                      )
                    ],
                  )),
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              Text(
                "Recent Transactions",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Card(
                      color: Color(0xFF0B2C44),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(26))),
                      child: typeList.isEmpty
                          ? const Center(
                              child: Text('No Transactions Yet',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.white)))
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: typeList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 5,
                                        bottom: 10),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          boxShadow: [
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
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
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
                                                    typeList[index],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xFFFFFFFF)),
                                                  ),
                                                  Text(
                                                    dateList[index],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w200,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFFFFFFFF)),
                                                  )
                                                ]),
                                            Text(
                                              "+ PHP " +
                                                  NumberFormat('###,000.00')
                                                      .format(
                                                          amountList[index]),
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
                              })),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  void refreshData() {
    account.accountBalance;
    typeList;
    dateList;
    amountList;
  }

  onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  void navigateNextPage() {
    Route route = MaterialPageRoute(
        builder: (context) => TransactionScreen(account: account));
    Navigator.push(context, route).then(onGoBack);
  }
}
