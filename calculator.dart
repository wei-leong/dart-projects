import 'dart:io';

double savedNum = 0; 

void main(){
  while(true){
    // Print Message from Function
    String message = returnMessage(); 
    print(message);

    // Receive Input
    int userInput = checkNumInput();
    switch (userInput){
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
        return;
      default:
        print("Invalid Range, Please Try Again \n");
    }
  }
}

int checkNumInput({String msg = "Please enter a number : "}){
  while(true){
    stdout.write(msg);
    int? userInput = int.tryParse(stdin.readLineSync()!);
    if(userInput != null){
      return userInput;
    }else{
      print("Invalid Input, please try again \n");
    }
  }
}

double checkDoubleInput({String msg = "Please enter a number : "}){
  while(true){
    stdout.write(msg);
    double? userInput = double.tryParse(stdin.readLineSync()!);
    if(userInput != null){
      return userInput;
    }else{
      print("Invalid Input, please try again \n");
    }
  }
}

void addition(){
  if(savedNum == 0){
    double firstValue = checkDoubleInput(msg:"\nPlease enter 1st Value : ");
    double secondValue = checkDoubleInput(msg:"\nPlease enter 2nd Value : ");

    savedNum = firstValue + secondValue;
    print("\nAddition Value");
    print("$firstValue + $secondValue = $savedNum" + "\n");
  }else{
    double pastSaveState = savedNum;
    double secondValue = checkDoubleInput(msg:"\n" + "$savedNum + ");
    savedNum += secondValue;
    print("\nAddition Value");
    print("$pastSaveState + $secondValue = $savedNum" + "\n");
  }
}

void subtraction(){
  if(savedNum == 0){
    double firstValue = checkDoubleInput(msg:"\nPlease enter 1st Value : ");
    double secondValue = checkDoubleInput(msg:"\nPlease enter 2nd Value : ");

    savedNum = firstValue - secondValue;
    print("\nSubtraction Value");
    print("$firstValue + $secondValue = $savedNum" + "\n");
  }else{
    double pastSaveState = savedNum;
    double secondValue = checkDoubleInput(msg:"\n" + "$savedNum - ");
    savedNum -= secondValue;
    print("\nSubtraction Value");
    print("$pastSaveState - $secondValue = $savedNum" + "\n");
  }
}

void multiplication(){
  if(savedNum == 0){
    double firstValue = checkDoubleInput(msg:"\nPlease enter 1st Value : ");
    double secondValue = checkDoubleInput(msg:"\nPlease enter 2nd Value : ");

    savedNum = firstValue * secondValue;
    print("\nMultiplication Value");
    print("$firstValue x $secondValue = $savedNum" + "\n");
  }else{
    double pastSaveState = savedNum;
    double secondValue = checkDoubleInput(msg:"\n" + "$savedNum x ");
    savedNum *= secondValue;
    print("\nMultiplication Value");
    print("$pastSaveState x $secondValue = $savedNum" + "\n");
  }
}

void division(){
  if(savedNum == 0){
    double firstValue = checkDoubleInput(msg:"\nPlease enter 1st Value : ");
    double secondValue = checkDoubleInput(msg:"\nPlease enter 2nd Value : ");

    savedNum = firstValue / secondValue;
    print("\nDivision Value");
    print("$firstValue / $secondValue = $savedNum" + "\n");
  }else{
    double pastSaveState = savedNum;
    double secondValue = checkDoubleInput(msg:"\n" + "$savedNum / ");
    savedNum *= secondValue;
    print("\nMultiplication Value");
    print("$pastSaveState / $secondValue = $savedNum" + "\n");
  }
}

void clearSavedNumber(){
  savedNum = 0;
}

String returnMessage(){
  String message = 
"""
Basic Calculator App
____________________
1. Addition
2. Subtraction
3. Multiplication
4. Division
5. Clear Saved Numbers
6. Exit
""";
  return message;
}