// Create a simple Todo List
// 1. Add Task
// 2. View Task 
// 3. Mark Done
// 4. Remove Task
// 5. Exit

import 'dart:io';

void main(){
  int returnedInput = menuReturn();
  switch(returnedInput){
    case 1:
      // Function Here
      break;
    case 2:
      // Function Here
      break;
    case 3:
      // Function Here
      break;
    case 4:
      // Function Here
      break;
    case 5:
      print("Exit Successful");
      break;
    default:
      print("Invalid Input, Please Try Again");
      break;
  }
}

int menuReturn(){
  String menu = 
  """
Todo List CLI Menu
__________________
1. Add Task
2. View Task 
3. Edit Task
4. Mark Done
5. Remove Task
  """;

  print(menu);
  stdout.write("Type number here: ");
  int? input = int.parse(stdin.readLineSync()!);
  return input;
}