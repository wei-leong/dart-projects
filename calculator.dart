import 'dart:io';

double savedNum = 0;

String returnMessage() {
  String message = """
Basic Calculator App
____________________
1. Addition
2. Subtraction
3. Multiplication
4. Division
5. Clear Saved Numbers
6. Multiple Calculation
7. Exit
""";
  return message;
}

void main() {
  while (true) {
    // Print Message from Function
    String message = returnMessage();
    print(message);

    // Receive Input
    int userInput = checkNumInput();
    switch (userInput) {
      case 1:
        addition();
        break;
      case 2:
        subtraction();
        break;
      case 3:
        multiplication();
        break;
      case 4:
        division();
        break;
      case 5:
        clearSavedNumber();
        break;
      case 6:
        multipleCalculate();
        break;
      case 7:
        return;
      default:
        print("Invalid Range, Please Try Again \n");
    }
  }
}

void addition() {
  if (savedNum == 0) {
    double firstValue = checkDoubleInput(msg: "\nPlease enter 1st Value : ");
    double secondValue = checkDoubleInput(msg: "\nPlease enter 2nd Value : ");

    savedNum = firstValue + secondValue;
    print("\nAddition Value");
    print("$firstValue + $secondValue = ${savedNum.toStringAsFixed(2)}" + "\n");
  } else {
    double pastSaveState = savedNum;
    double secondValue = checkDoubleInput(msg: "\n" + "$savedNum + ");
    savedNum += secondValue;
    print("\nAddition Value");
    print(
      "$pastSaveState + $secondValue = ${savedNum.toStringAsFixed(2)}" + "\n",
    );
  }
}

void subtraction() {
  if (savedNum == 0) {
    double firstValue = checkDoubleInput(msg: "\nPlease enter 1st Value : ");
    double secondValue = checkDoubleInput(msg: "\nPlease enter 2nd Value : ");

    savedNum = firstValue - secondValue;
    print("\nSubtraction Value");
    print("$firstValue + $secondValue = ${savedNum.toStringAsFixed(2)}" + "\n");
  } else {
    double pastSaveState = savedNum;
    double secondValue = checkDoubleInput(msg: "\n" + "$savedNum - ");
    savedNum -= secondValue;
    print("\nSubtraction Value");
    print(
      "$pastSaveState - $secondValue = ${savedNum.toStringAsFixed(2)}" + "\n",
    );
  }
}

void multiplication() {
  if (savedNum == 0) {
    double firstValue = checkDoubleInput(msg: "\nPlease enter 1st Value : ");
    double secondValue = checkDoubleInput(msg: "\nPlease enter 2nd Value : ");

    savedNum = firstValue * secondValue;
    print("\nMultiplication Value");
    print("$firstValue x $secondValue = ${savedNum.toStringAsFixed(2)}" + "\n");
  } else {
    double pastSaveState = savedNum;
    double secondValue = checkDoubleInput(msg: "\n" + "$savedNum x ");
    savedNum *= secondValue;
    print("\nMultiplication Value");
    print(
      "$pastSaveState x $secondValue = ${savedNum.toStringAsFixed(2)}" + "\n",
    );
  }
}

void division() {
  if (savedNum == 0) {
    double firstValue = checkDoubleInput(msg: "\nPlease enter 1st Value : ");
    double secondValue = checkDoubleInput(msg: "\nPlease enter 2nd Value : ");

    savedNum = firstValue / secondValue;
    print("\nDivision Value");
    print("$firstValue / $secondValue = ${savedNum.toStringAsFixed(2)}" + "\n");
  } else {
    double pastSaveState = savedNum;
    double secondValue = checkDoubleInput(msg: "\n" + "$savedNum / ");
    savedNum *= secondValue;
    print("\nMultiplication Value");
    print(
      "$pastSaveState / $secondValue = ${savedNum.toStringAsFixed(2)}" + "\n",
    );
  }
}

void multipleCalculate() {
  List<String> numList;
  if (savedNum == 0) {
    String input = checkUserInput();
    numList = convertInput(input);
    print("\nMulti Calculate Value");
    print("$input = ${evaluateList(numList)}\n");
  } else {
  }
}

void clearSavedNumber() {
  savedNum = 0;
}

String checkUserInput({String msg = "Please enter a number : "}) {
  final pattern = RegExp(r'^[0-9+\-*/ ]+$');
  while (true) {
    stdout.write("Enter a list of Number to Calculate : ");
    String input = stdin.readLineSync()!;
    if (!pattern.hasMatch(input)) {
      print(
        "Include only numbers and operators ( + , - , * , / ), please try again\n",
      );
      continue;
    } else {
      String cleanedInput = input.replaceAll(" ", "");
      return cleanedInput;
    }
  }
}

List<String> convertInput(String userInput) {
  final pattern = RegExp(r'(\d+|\+|\-|\*|/)');
  final List<String> process = pattern
      .allMatches(userInput)
      .map((items) => items.group(0)!)
      .toList();
  return process;
}

double evaluateList(List<String> numberList){
  // First Pass : Handle * and /
  final firstPass = <String>[]; // Create a new list to store value after * and /
  
  for(int i = 0 ; i<numberList.length ; i++){
    String item = numberList[i];
    if(item == "*" || item == "/"){
      double left = double.parse(firstPass.removeLast()); // Remove Last element so it shows 3 value ( left , symbol , right )
      double right = double.parse(numberList[++i]);
      double result = item == "*" ? left * right : left / right;
      firstPass.add(result.toString());
    }else{
      firstPass.add(item);
    }
  }

  // Second Pass : Handle + and -
  double total = double.parse(firstPass[0]);
  for(int i = 1 ; i<firstPass.length ; i+=2){
    String symbol = firstPass[i];
    double nextValue = double.parse(firstPass[i+1]);

    if(symbol == "+"){
      total+=nextValue;
    }else{
      total-=nextValue;
    }
  }

  return total;
}

int checkNumInput({String msg = "Please enter a number : "}) {
  while (true) {
    stdout.write(msg);
    int? userInput = int.tryParse(stdin.readLineSync()!);
    if (userInput != null) {
      return userInput;
    } else {
      print("Invalid Input, please try again \n");
    }
  }
}

double checkDoubleInput({String msg = "Please enter a number : "}) {
  while (true) {
    stdout.write(msg);
    double? userInput = double.tryParse(stdin.readLineSync()!);
    if (userInput != null) {
      return userInput;
    } else {
      print("Invalid Input, please try again \n");
    }
  }
}
