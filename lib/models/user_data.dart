import 'package:intl/intl.dart';

class Accounts {
  String firstName = "John";
  String lastName = "Jones";
  String accountNumber = "2018 1032 1229";
  String expDate = "06/24";
  double accountBalance = 100000;

  transfer(amount) {
    accountBalance -= amount;
  }
}
