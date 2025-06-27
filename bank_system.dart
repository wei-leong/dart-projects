// Create a banking system using Class 
// 1. Login
// 2. Display Account Information
// 3. Deposit
// 4. Withdrawal

import 'dart:io';

void main(){
  Bank john = new Bank("John Smith" , "12345678", 1900);
}
class Bank{
  // Attributes
  String accountName;
  String password;
  double currentBalance;

  Bank(this.accountName,this.password,this.currentBalance);

  void deposit(){
    print("Current Balance : $currentBalance");
    double depositAmount = checkDoubleInput( msg : "Please enter a amount to Deposit : ");
    currentBalance += depositAmount;
    print("\n" + "Current Balance : $currentBalance");
  }

  void withdrawal(){
    print("Current Balance : $currentBalance");
    double withdrawalAmount = checkDoubleInput( msg : "Please enter a amount to Withdrawal : ");
    currentBalance -= withdrawalAmount;
    print("\n" + "Current Balance : $currentBalance");
  }

  void showAccountBalance(){
    print("Current Balance : $currentBalance");
  }

  void displayAccountInformation(){
    print("Account Information");
    print("___________________");
    print("Account Name : $accountName");
    print("Account Password : $password");
    print("Current Balance : $currentBalance");
  }

  double checkDoubleInput({String msg = "Please enter a amount : "}) {
    while (true) {
      stdout.write(msg);
      double? userInput = double.tryParse(stdin.readLineSync()!);
      if (userInput != null) {
        return userInput;
      } else {
        print("Invalid Input, please try again \n");
      }
    }
  }
}

