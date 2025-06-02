// Create a simple Todo List
// 1. Add Task
// 2. View Task 
// 3. Mark Done
// 4. Remove Task
// 5. Exit

import 'dart:io';

// Global Variable : Todo
Map<String,bool> todo = {
  "Play Cyberpunk 2077": false,
  "Clean the House": false,
  "Drink Milk":true, // This task is done and won't be shown at View Task
};

// Main Function
void main(){
  menu();
}

void menu(){
  String menu = 
  """

Todo List CLI Menu
__________________
1. View Task
2. Add Task 
3. Edit Task
4. Mark Done
5. Remove Task
6. Exit
  """;

  print(menu);
  stdout.write("Type number here: ");
  int? input = int.parse(stdin.readLineSync()!);
    switch(input){
    case 1:
      viewTask();
      break;
    case 2:
      addTask();
      break;
    case 3:
      // Function Here
      break;
    case 4:
      // Function Here
      break;
    case 5:
      removeTask();
      break;
    case 6: 
      print("Exit Successful");
      break;
    default:
      print("Invalid Input, Please Try Again");
      break;
  }
}

void showTask(){
  int i = 1;
  for(var task in todo.entries){ // Entries includes keys and values
    if (!task.value){
      print("$i. ${task.key}");
      i++;
    }
  }
}

void viewTask(){
  showTask();
  menu();
}

void addTask(){
  // Accept New Tasks
  stdout.write("Add new task here: ");
  String input = stdin.readLineSync()!;

  // Add Task to todo Map Global Variables
  final todoInput = <String,bool>{input.toString():false};
  todo.addEntries(todoInput.entries);

  // Return to menu once Task is added
  menu();
}

void removeTask(){
  // Show The Task
  showTask();

  // Remove task with Number Input
  stdout.write("Remove Task By Number: ");
  int? input = int.parse(stdin.readLineSync()!);

  // Remove Task from Global Variable
  String taskToRemove = todo.keys.elementAt(input - 1) ;
  todo.remove(taskToRemove);

  print("Removed $taskToRemove");

  // Return To Menu
  menu();
}