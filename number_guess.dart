// Computer will pick a random number between user selected range ( 0 - 100 )
// And the user will be trying to guess it, the program will tells if it is too low, too high and correct
// The game continues after user guess the corrects number

import 'dart:io';
import 'dart:math';

void main(){
  stdout.write("Enter Range ( Low ) : ");
  int? low = int.parse(stdin.readLineSync()!); // stdin.readLineSync()! means this will be accepting a value
  printLine();
  
  stdout.write("Enter Range ( High ) : ");
  int? high = int.parse(stdin.readLineSync()!); // stdin.readLineSync()! means this will be accepting a value
  printLine();

  execution(low,high);
}

void execution( int low, int high){
  bool isCorrect = false;

  int generateRandom = Random().nextInt(high) + low; // Range x >= low ( + low ) and x<= high

  while(!isCorrect){
    stdout.write("Please enter your guessed number : ");
    int? guessedNum = int.parse(stdin.readLineSync()!);
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
