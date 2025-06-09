// Computer will pick a random number between user selected range ( 0 - 100 )
// And the user will be trying to guess it, the program will tells if it is too low, too high and correct
// The game continues after user guess the corrects number

import 'dart:io';
import 'dart:math';

void main(){
  int low = 0;
  int high = 0;
  bool isRangeValid = false;
  while(!isRangeValid){
    low = checkNumberAvailability("Enter Range ( Low ) : ");
    printLine();
    high = checkNumberAvailability("Enter Range ( High ) : ");
    printLine();
    if(low > high){
      print("Range Error ( Low can't be greater than High )");
      printLine();
      continue;
    }else{
      break;
    }
  }
  execution(low,high);
}

int checkNumberAvailability(String message){
  bool isCorrect = false;
  int inputNum = 0;
  while(!isCorrect){
    try{
      stdout.write(message);
      inputNum = int.parse(stdin.readLineSync()!);
      break;
    }on FormatException catch (e){
      print("Please input numbers only! ( Error Message : $e)");
      continue;
    }
  }
  return inputNum;
}

void execution(int low, int high){
  bool isCorrect = false;
  // if high is 10 , Random.nextInt(high) will generate values 0 to 9 , where the high is like index / range
  int generateRandom = Random().nextInt(high - low + 1) + low; // Range x >= low ( + low ) and x<= high

  while(!isCorrect){
    int guessedNum = checkNumberAvailability("Please enter your guessed number : ");
    isCorrect = guess(guessedNum,generateRandom);
  }
}

bool guess(int guess,int randomNumber){
  if(guess == randomNumber){
    print("Correct, Program Ends");
    return true;
  }else if( guess < randomNumber){
    print("Number is too low");
    printLine();
    return false;
  }else{
    print("Number is too high");
    printLine();
    return false;
  }
  // return guess == randomNumber ? true : false ;
}

void printLine(){
  print(" ");
}
