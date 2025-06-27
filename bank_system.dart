// Create a banking system using Class 
// 1. Login
// 2. Display Account Information
// 3. Deposit
// 4. Withdrawal

import 'dart:io';
Bank john = Bank("John Smith" , "12345678", 1900);

void main(){
  login();
  menu();
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
    print("\n" + "Current Balance : $currentBalance" + "\n");
  }

  void withdrawal(){
    while(true){
      print("Current Balance : $currentBalance");
      double withdrawalAmount = checkDoubleInput( msg : "Please enter a amount to Withdrawal : ");
      if (currentBalance - withdrawalAmount < 0 ){
        print("Withdraw failed, please try again\n");
      }else{
        currentBalance -= withdrawalAmount;
        print("\n" + "Current Balance : $currentBalance " + "\n");
        break;
      }
    }
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

void login(){
  while(true){
    print("Login\n_____\n");
    stdout.write("Account Name : ");
    String name = stdin.readLineSync()!;
    stdout.write("Password : ");
    String password = stdin.readLineSync()!;

    if(name == john.accountName){
      if(password == john.password){
        break;
      }else{
        print("Invalid password, please try again\n");
        continue;
      }
    }else{
      print("Invalid Account Name, please try again\n");
      continue;
    }
  }
}

void menu(){
  while(true){
    print("Menu\n____\n1. Deposit\n2. Withdrawal\n3. Display Account Information\n4. Logout");
    stdout.write("Enter a Value : ");
    int? input = int.tryParse(stdin.readLineSync()!);

    if(input != null ){
      switch(input){
        case 1:
          john.deposit();
          break;
        case 2:
          john.withdrawal();
          break;
        case 3:
          john.displayAccountInformation();
          break;
        case 4:
          return;
        default:
          print("Please enter the correct value\n");
          break;
      }
    }else{
      print("Please enter only integer values\n");
      continue;
    }
  }
}