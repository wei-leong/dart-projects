/*
  Questions Description:
  1. How do we replace vowels (a, e, i, o, u) with asterisks (*) in the string?
  2. What method do we use to reverse the string in Dart?
  3. How can we capitalize the first letter of the string while leaving the rest unchanged?
*/

import 'dart:io';

void main(){
  // Receives User Input
  stdout.write("Enter a word : ");
  String userInput = stdin.readLineSync()!;

  // Replace Vowels to Asterisk ( * ) Function
  String replacedWords = userInput.replaceAll(RegExp("[aeiou]",caseSensitive: false), "*");

  // Reverse the String Value
  // replacedWords is first split into List, reversed and join the list into string value
  String reverseWords = replacedWords.split("").reversed.join();
  print(reverseWords);
}