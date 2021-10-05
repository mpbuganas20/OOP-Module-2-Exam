class Transactions {
  String type;
  String date;
  double amount;

  Transactions(this.type, this.date, this.amount);
}

List<Transactions> transactions = transactionsData
    .map(
      (data) => Transactions(
        data['type'] as String,
        data['date'] as String,
        data['amount'] as double,
      ),
    )
    .toList();

var transactionsData = [
  {
    "type": "Deposit",
    "date": "Sept 5",
    "amount": 500.00,
  },
  {
    "type": "Transfer",
    "date": "Sept 5",
    "amount": 10000.00,
  }
];
