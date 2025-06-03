// This project is about creating a Simple Contact Book
// User Can : 
// 1. View All Contact
// 2. Search Contact With A Specific Name
// 3. Add New Contact
// 4. Update Phone Number 
// 5. Delete A Contact
import 'dart:io';

void main(){
  createMenu();
}

void createMenu(){
  int menuItems = 5;
  String menu = 
"""
Simple Contact Menu
1. View All Contact
2. Search Contact 
3. Add New Contact
4. Update Phone Number
5. Delete A Contact

""";

  print(menu);
  
  // Receive Input from User
  int? input = userInput(menuItems);
  print("User Input : $input");
  


}

int? userInput(int menuItems){
  // Variable for Loop
  bool isInt = false;
  int? inputNum = 0;

  while(!isInt){
    // User Input 
    stdout.write("Please enter a number : ");
    inputNum = int.tryParse(stdin.readLineSync()!);

    if(inputNum != null){
      if(inputNum <= 0 || inputNum > menuItems){
        print("Invalid number range, please try again");
        space();
        continue;
      }
      else{
        isInt = true;
        break;
      }
    }
    else{
      print("Invalid number format, please try again");
      space();
      continue;
    }
  }
  return inputNum;
}

void space(){
  print(" ");
}