// Computer will pick a random number between user selected range ( 0 - 100 )
// And the user will be trying to guess it, the program will tells if it is too low, too high and correct
// The game continues after user guess the corrects number

import 'dart:io';

void main(){
  print("Enter Range ( Low ) : ");
  int? low = int.parse(stdin.readLineSync()!); // stdin.readLineSync()! means this will be accepting a value
  
  print("Enter Range ( High ) : ");
  int? high = int.parse(stdin.readLineSync()!); // stdin.readLineSync()! means this will be accepting a value

}

void execution(int low, int high){

}

