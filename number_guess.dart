// Computer will pick a random number between user selected range ( 0 - 100 )
// And the user will be trying to guess it, the program will tells if it is too low, too high and correct
// The game continues after user guess the corrects number

import 'dart:io';
import 'dart:math';

void main(){
  print("Enter Range ( Low ) : ");
  int? low = int.parse(stdin.readLineSync()!); // stdin.readLineSync()! means this will be accepting a value
  
  print("Enter Range ( High ) : ");
  int? high = int.parse(stdin.readLineSync()!); // stdin.readLineSync()! means this will be accepting a value

  execution(low,high);
}

void execution( int low, int high){
  bool isCorrect = false;

  int generateRandom = Random().nextInt(high) + low; // Range x >= low ( + low ) and x<= high

  while(!isCorrect){
    print("Please enter your guessed number : ");
    int? guessedNum = int.parse(stdin.readLineSync()!);
    isCorrect = guess(guessedNum,generateRandom);
  }
}

bool guess(int guess,int randomNumber){

}

