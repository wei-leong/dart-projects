import 'dart:io';

int? savedNum; 

void main(){
  while(true){
    // Print Message from Function
    String message = returnMessage(); 
    print(message);

    // Receive Input
    int userInput = checkNumInput();
    switch (userInput){
      case 1:
        print("1");
        return;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        return;
      default:
        print("Invalid Range, Please Try Again \n");
    }
  }
}

int checkNumInput({String msg = "Please enter a number : "}){
  while(true){
    stdout.write(msg);
    int? userInput = int.tryParse(stdin.readLineSync()!);
    if(userInput != null){
      return userInput;
    }else{
      print("Invalid Input, please try again \n");
    }
  }
}

String returnMessage(){
  String message = 
"""
Basic Calculator App
____________________
1. Addition
2. Subtraction
3. Multiplication
4. Division
5. Clear Saved Numbers
6. Exit
""";
  return message;
}