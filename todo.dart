// Create a simple Todo List
// 1. Add Task
// 2. View Task 
// 3. Mark Done
// 4. Remove Task
// 5. Exit

import 'dart:io';

void main(){
  int returnedInput = menuReturn();
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