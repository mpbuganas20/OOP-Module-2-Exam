import 'dart:math';

class Transaction {
  String type;
  String date;
  double balance;
  String accNumTransferredTo;
  String accNameTransferredTo;
  int transactionNumber;
  Transaction(
      {required this.type,
      required this.date,
      required this.balance,
      required this.accNumTransferredTo,
      required this.accNameTransferredTo,
      required this.transactionNumber});
}

List<Transaction> transactions = [];

transactionNumberGenerator() {
  var random = new Random();
  int min = 100000;
  int max = 200000;
  int result = min + random.nextInt(max - min);
  return result;
}
