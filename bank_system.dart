// Create a banking system using Class 
// 1. Login ( Customer / Manager )
// 2. Display Account Information
// 3. Deposit
// 4. Withdrawal

import 'dart:io';

List<Customer> customerList = [
  Customer("John Smith", "12345678", 1000),
  Customer("Johnny Silverhand", "samurai", 10),
  Customer("V", "1a2b3c4d5e", 100000),
];

void main(){
}

class BankLogin{
  String? accountName;
  String? accountPassword;

  BankLogin(this.accountName,this.accountPassword);

  bool validateUser(){
    for(Customer i in customerList){
      if(accountName == i._accountName && accountPassword == i._accountPassword){
        return true;
      }
    }
    return false;
  }
}

class Person{
  String? _accountName;
  String? _accountPassword;
  String role = "";

  // Person's constructor to let subclasses call super(...)
  Person(this._accountName, this._accountPassword, {this.role = ''});

  void displayUserDetails(){
    print("User Settings");
    print("Account Name : $_accountName");
    print("User Role : $role");
    print("Account Password : ${returnHiddenPassword()}");
  }

  String returnHiddenPassword(){
    String value = "";
    for(int i = 0 ; i < _accountPassword!.length ; i++){
      value = value + "*";
    }
    return value;
  }
}

class Customer extends Person implements BankTransfer{
  double _accountBalance = 0;

  Customer(String customerName,String customerPassword, this._accountBalance,{String role = "Customer"}) 
      : super(customerName,customerPassword,role: role);

  @override
  void deposit(){
    double depositAmount = inputValidate("Deposit ( Balance $_accountBalance ): ");
    _accountBalance += depositAmount;
  }
  void withdrawal(){
    while(true){
      double withdrawalAmount = inputValidate("Withdrawal ( Balance $_accountBalance ): ");
      if(withdrawalAmount>_accountBalance){
        print("Amount Withdrawal Exceeds Account Balance, Please Try Again");
        continue;
      }else{
        print("Amount $withdrawalAmount successfully withdraw");
        break;
      }
    }
  }

  double inputValidate(String actions){
    while(true){
      stdout.write("Enter The Amount You Wanted to $actions : ");
      double? amount = double.tryParse(stdin.readLineSync()!);

      if(amount != null){
        return amount;
      }else{
        print("Please enter amount only.");
      }
    }
  }
}

abstract class BankTransfer{
  void deposit();
  void withdrawal();
}