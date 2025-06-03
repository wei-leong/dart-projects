// This project is about creating a Simple Contact Book
// User Can : 
// 1. View All Contact
// 2. Search Contact With A Specific Name
// 3. Add New Contact
// 4. Update Phone Number 
// 5. Delete A Contact
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
  int menuItems = 6;
  String menu = 
"""
Simple Contact Menu
1. View All Contact
2. Search Contact 
3. Add New Contact
4. Update Phone Number
5. Delete A Contact
6. Exit

""";

  print(menu);
  
  // Receive Input from User
  int? input = userInput(menuItems);
  
  switch(input){
    case 1: viewAllContact(); break;
    case 2: searchContact();  break;
    case 3: addNewContact();  break;
    case 4: updateContact();  break;
    case 5: deleteContact();  break;
    case 6: break;
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

void printContact(){
  int i = 1;
  for(var contacts in contactList.entries){
    print("$i. ${contacts.key} (${contacts.value})");
    i++;
  }
}

void viewAllContact(){
  printContact();
  space();
  createMenu();
}

void searchContact(){
  bool isDone = false;
  while(!isDone){
    bool isFound = false;
    stdout.write("Search Bar ( Name ): ");
    String name = stdin.readLineSync()!;

    for(var contact in contactList.entries){
      if(name == contact.key){
        space();
        print("Found Contact List : ");
        print("${contact.key} (${contact.value})");
        space();
        isDone = true;
        isFound = true;
        break;
      }
    }

    if(!isFound){
      print("No contact found, please try again");
      space();
      continue;
    }
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

void removeContactWithId(){
  stdout.write("Please enter Contact in Number to Update : ");
  int? removeID = int.tryParse(stdin.readLineSync()!);

  // In Map, keys are unique and can't be changed, so I need to delete and add it again
  String contactToDelete = contactList.keys.elementAt(removeID! -1);
  contactList.remove(contactToDelete);
}

void updateContact(){
  printContact();
  space();
  removeContactWithId();
  addNewContact(); // Doesn't need to add createMenu() because removeContactWithId alr has one
}

void deleteContact(){
  printContact();
  space();
  removeContactWithId();
  createMenu();
}

void space(){
  print(" ");
}