class Accounts {
  String firstName = "John";
  String lastName = "Jones";
  String accountNumber = "201810321229";
  String expDate = "06/24";
  double accountBalance = 100000;

  transfer(amount) {
    accountBalance -= amount;
  }
}
