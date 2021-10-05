class Accounts {
  String userName;
  String userNumber; //max 11 char
  double userBalance = 100000.00;

  Accounts(this.userName, this.userNumber, this.userBalance);

  transferMoney(String name, String number, double amount) {
    String transfereeName = name;
    String transfereeNumber = number;
    double amountTransfered = amount;
  }

  validateTransfer(double amount) {
    bool isTrue = false;
    if (amount > 200) {
      isTrue = true;
      return isTrue;
    } else if (amount > this.userBalance) {
      isTrue = false;
      return isTrue;
    }
  }
}
