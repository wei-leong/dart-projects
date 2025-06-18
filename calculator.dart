import 'dart:io';

int? savedNum; 

void main(){
  while(true){
    String message = returnMessage(); 

  }
}

int checkNumInput(String msg){
  while(true){
    stdout.write(msg);
    int? userInput = int.tryParse(stdin.readLineSync()!);
    if(userInput != null){
      return userInput;
    }else{
      print("Invalid Input, please try again");
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