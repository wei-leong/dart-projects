// This project is about creating a Simple Contact Book
// User Can : 
// 1. View All Contact
// 2. Search Contact With A Specific Name
// 3. Add New Contact
// 4. Update Phone Number 
// 5. Delete A Contact
import 'dart:developer';
import 'dart:io';

Map<String,String> contactList = {
  "John Cena":"0177755563",
  "John Wick":"0177123712",
  "V":"0177453462",
  "Leon S. Kennedy":"0166654345",
  "Albert Wesker":"0177345345",
  "Ethan Winters":"0178342345",
  "Luis Serra":"0178342345",
};

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
  
  switch(input){
    case 1:
      viewAllContact();
      break;
    case 2:
      break;
    case 3:
      addNewContact();
      break;
    case 4:
      break;
    case 5:
      break;
  }
}

int? userInput(int menuItems){
  // Variable for Loop
  bool isInt = false;
  int? inputNum = 0;

  while(!isInt){
    // User Input 
    stdout.write("Please enter a number : ");
    // ! tryParse will return null when user is not input integer value
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

void viewAllContact(){
  int i = 1;
  for(var contacts in contactList.entries){
    print("$i. ${contacts.key} (${contacts.value})");
    i++;
  }
  createMenu();
}

void addNewContact(){
  stdout.write("Name : ");
  String contactName = stdin.readLineSync()!;
  
  String contactNumber = validateContact()!;

  final newContact = <String,String>{contactName:contactNumber};
  print("Contact Added To DB");
  space();

  contactList.addEntries(newContact.entries);
  createMenu();
}

String? validateContact(){
  String? inputContactNum = "";
  bool isContactCorrect = false;

  while(!isContactCorrect){
    stdout.write("Number : ");
    // ! tryParse will return null when user is not input integer value
    inputContactNum = stdin.readLineSync()!;
    int? contactNum = int.tryParse(inputContactNum);

    if(contactNum != null){
      if(inputContactNum.length > 10 || inputContactNum.length < 8){
        print("Phone Number length is over 10, please try again");
        space();
        continue;
      }else{
        isContactCorrect = true;
        break;
      }
    }else{
      print("Invalid contact number format, please try again");
      space();
      continue;
    }
  }
  return inputContactNum;
}

void space(){
  print(" ");
}