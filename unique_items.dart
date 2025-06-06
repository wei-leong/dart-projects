// Write a program to repeatedly ask the user to enter a word or number, then it is added with set for uniqueness
// After each entry provide a menu, show how many unique items so for with length
// When user type E ( Other Alphabet ), it will stop the loop and print the set alphabetically
// Tips : Since Set doesn't have sort function, we need to convert to List and use the sort method

import 'dart:io';

// Global Variable
Set<String> uniqueItems = {};

void main(){
  repeatInput();
}

void repeatInput(){
  bool isTerminated = false;
  while(!isTerminated){
    String input = checkInput();
    if(input == "exit"){
      isTerminated = true;
      break;
    }else{
      uniqueItems.add(input);
      print("Number of Unique Items : ${uniqueItems.length}");
      space();
      continue;
    }
  }
  space();
  List<String> list = uniqueItems.toList()..sort();
  printSortedList(list);
  print("Program Ends");
}

String checkInput(){
  stdout.write("Input Value to Check for Uniqueness : ");
  String? userInput = stdin.readLineSync()!;
  return userInput;
}

void printSortedList(List<String> list){
  int i = 1;
  for (var items in list){
    print("$i. $items");
    i++;
  }
  space();
}

void space(){
  print(" ");
}