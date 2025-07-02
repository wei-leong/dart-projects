// Create a banking system using Class 
// 1. Login ( Customer / Manager )
// 2. Display Account Information
// 3. Deposit
// 4. Withdrawal

void main(){
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