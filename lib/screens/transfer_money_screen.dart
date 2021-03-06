import 'package:bankingapp/models/user_transactions.dart';
import 'package:bankingapp/screens/transfer_confirmation_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/models/user_data.dart';
import 'dashboard_screen.dart';

class TransactionScreen extends StatelessWidget {
  final amountTransferred = TextEditingController();
  final accountNameReceiver = TextEditingController();
  final accountNumberReceiver = TextEditingController();
  final noteForReceiver = TextEditingController();
  final transactionNumber = transactionNumberGenerator();
  final Accounts account;
  final String date = DateFormat("yyyy-MM-dd").format(DateTime.now());

  TransactionScreen({Key? key, required this.account}) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3 + 10,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(64),
                        bottomRight: Radius.circular(64)),
                    color: Color(0xFF0B2C44)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        new Material(
                          color: Color(0xFF0B2C44),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DashboardScreen()));
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                        Text(
                          "Transfer Money",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 22),
                        )
                      ],
                    ),
                    Text(
                      "Select Card To Use",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Color(0xFFFFFFFF)),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF334756),
                          fixedSize: Size(290, 130),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          Text(
                            account.accountNumber,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFFFFFFFF),
                                letterSpacing: 8),
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                account.expDate,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF)),
                              ),
                              Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Color(0xFFFFFFFF),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 10),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: amountTransferred,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                        ],
                        validator: (value) {
                          if (double.parse(value!) < 200 ||
                              double.parse(value) > account.accountBalance) {
                            //allow upper and lower case alphabets and space
                            return '';
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF)),
                        decoration: InputDecoration(
                          errorStyle: TextStyle(height: 0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF0B2C44), width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF0B2C44), width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Amount to Transfer",
                          hintText: "Must not below PHP 200",
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF).withOpacity(0.2)),
                          labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFFFFF)),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Text(
                          "Current Balance: PHP " +
                              NumberFormat('###,000.00')
                                  .format(account.accountBalance),
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: accountNameReceiver,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            //allow upper and lower case alphabets and space
                            return '';
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF)),
                        decoration: InputDecoration(
                          errorStyle: TextStyle(height: 0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF0B2C44), width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF0B2C44), width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Receiver Account Name",
                          hintText: "John Jones",
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF).withOpacity(0.2)),
                          labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFFFFF)),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: accountNumberReceiver,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          LengthLimitingTextInputFormatter(12)
                        ],
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp('[0-9]').hasMatch(value) ||
                              value.length != 12 ||
                              value == account.accountNumber) {
                            //allow upper and lower case alphabets and space
                            return '';
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF)),
                        decoration: InputDecoration(
                          errorStyle: TextStyle(height: 0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF0B2C44), width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF0B2C44), width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Receiver Account Number",
                          hintText: "Enter 12 digit account number",
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF).withOpacity(0.2)),
                          labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFFFFF)),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: noteForReceiver,
                        validator: (value) => value!.isNotEmpty ? null : '',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF)),
                        decoration: InputDecoration(
                          errorStyle: TextStyle(height: 0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF0B2C44), width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF0B2C44), width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: "Note",
                          hintText: "Loan",
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF).withOpacity(0.2)),
                          labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 25, right: 25, bottom: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (formGlobalKey.currentState!.validate()) {
                      transactions.add(new Transaction(
                          type: 'Transfer',
                          date: date,
                          balance: double.parse(amountTransferred.text),
                          accNumTransferredTo: accountNumberReceiver.text,
                          accNameTransferredTo: accountNameReceiver.text,
                          transactionNumber: transactionNumber));
                      account.transfer(double.parse(amountTransferred.text));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransferConfirmationScreen(
                                    amount: amountTransferred.text,
                                    name: accountNameReceiver.text,
                                    number: accountNumberReceiver.text,
                                    note: noteForReceiver.text,
                                    transactionNumber: transactionNumber,
                                  )));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Error')));
                    }
                    ;
                  },
                  child: const Text('Transfer'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF0A500),
                    minimumSize: Size(300, 55),
                    onPrimary: Color(0xFF000000),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
