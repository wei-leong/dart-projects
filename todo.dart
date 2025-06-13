// Create a simple Todo List
// 1. Add Task
// 2. View Task 
// 3. Mark Done
// 4. Remove Task
// 5. Exit
import 'dart:io';
import 'quiz_application.dart';

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
4. Mark Task ( Done / Undone )
5. Remove Task
6. Exit
  """;

  print(menu);
  bool isLoopDone = false;
  while(!isLoopDone){
    int input = checkIntInput();
    switch(input){
      case 1: viewTask(); isLoopDone = true; break;
      case 2: addTask(); isLoopDone = true;  break;
      case 3: editTask(); isLoopDone = true; break;
      case 4: markTaskMenu(); isLoopDone = true;  break;
      case 5: removeTask(); isLoopDone = true;  break;
      case 6: print("Exit Successful"); isLoopDone = true; break;
      default:  print("Invalid Input, Please Try Again"); space(); isLoopDone = false; break;
    }
  }
}

void showTask(){
  int i = 1;
  for(var task in todo.entries){ // Entries includes keys and values
    if (!task.value){
      print("$i. ${task.key}");
    }
    i++;
  }
}

void showAllTask(){
  int i = 1;
  for(var task in todo.entries){ // Entries includes keys and values
    print("$i. ${task.key}");
    i++;
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
  space();

  // Collect User Input
  stdout.write("Remove Task By Number: ");
  int? input = checkIntInput();

  // Remove Task from Global Variable
  String taskToRemove = todo.keys.elementAt(input - 1) ;
  todo.remove(taskToRemove);

  print("Removed $taskToRemove");

  // Return To Menu
  menu();
}

void markTaskMenu(){
    String menuItem = 
  """

Mark Task Menu
__________________
1. Done Task
2. Undone Task 
  """;

  print(menuItem);
  int? input = checkIntInput();
  switch(input){
    case 1: doneTask();  break;
    case 2: undoneTask();  break;
    default:  menu(); break;
  }
}

void doneTask(){
  // Show The Task
  showTask();

  // Collect User Input
  stdout.write("Mark Task Done By Number: ");
  int? input = checkIntInput();

  // Mark Task Done from Global Variable
  String taskToDone = todo.keys.elementAt(input - 1);
  todo.update(taskToDone, (value) => true);

  // Return to Menu
  menu();
}

void undoneTask(){
  // Show The Task
  showAllTask();

  // Collect User Input
  stdout.write("Mark Task Done By Number: ");
  int? input = checkIntInput();

  // Mark Task Done from Global Variable
  String taskToDone = todo.keys.elementAt(input - 1);
  todo.update(taskToDone, (value) => false);

  // Return to Menu
  menu();
}

void editTask(){
  // Show The Task
  showAllTask();
  space();

  // Collect User Input
  stdout.write("Edit Task Title By Number: ");
  int? input = checkIntInput();

  // New Title
  stdout.write("Please enter New Title: ");
  String? titleInput = stdin.readLineSync()!;
  final newTask = <String,bool>{titleInput.toString():false};

  // Remove Task from Global Variable
  String taskToRemove = todo.keys.elementAt(input - 1) ;
  todo.remove(taskToRemove);

  // Map Keys can't be changed
  // Add New Task 
  todo.addEntries(newTask.entries);

  // Return to Menu
  menu();
}

int checkIntInput({String message = "Type number here: "}){
  bool isInputValid = false;
  while(!isInputValid){
    stdout.write("Type number here: ");
    int? input = int.tryParse(stdin.readLineSync()!);
    if (input != null){
      return input;
    }else{
      print("Invalid Input, Please Try Again");
      space();
      continue;
    }
  }
}

int checkRangeError(String message){
  bool isValidInput = false;
  while(!isValidInput){
    try{
      stdout.write(message);
      int userInput = int.parse(stdin.readLineSync()!);
      space();
      return userInput;
    }on RangeError{
      print("Invalid Range, please try again");
      continue;
    }
  }
}