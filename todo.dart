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
  menuInput();
}

void menuInput(){
  bool isInputValid = false;
  while(!isInputValid){
    stdout.write("Type number here: ");
    int? input = int.tryParse(stdin.readLineSync()!);
    if (input != null){
      switch(input){
        case 1: viewTask(); break;
        case 2: addTask();  break;
        case 3: editTask(); break;
        case 4: markTaskMenu();  break;
        case 5: removeTask();  break;
        case 6: print("Exit Successful"); break;
        default:  print("Invalid Input, Please Try Again"); space(); continue;
      }
      break;
    }
    else{
      print("Invalid Input, Please Try Again");
      space();
      continue;
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
  int? input = int.parse(stdin.readLineSync()!);

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
  stdout.write("Type number here: ");
  int? input = int.parse(stdin.readLineSync()!);
  switch(input){
    case 1:
      doneTask();
      break;
    case 2:
      undoneTask();
      break;
    default:
      menu();
      break;
  }
}

void doneTask(){
  // Show The Task
  showTask();

  // Collect User Input
  stdout.write("Mark Task Done By Number: ");
  int? input = int.parse(stdin.readLineSync()!);

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
  int? input = int.parse(stdin.readLineSync()!);

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
  int? input = int.parse(stdin.readLineSync()!);

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