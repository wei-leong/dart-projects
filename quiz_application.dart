// Create a Console Quiz Application that stores a 5 questions
// Create 2 Maps ( Questions Map<String,<List<String>>, Answer Map<String,String>)
// Print Out the Score ( n/5 ) after user finished answering the questions 

// Store Total Number of Questions for Display Score 
int totalQuestions = questionsList.length;

// Question List ( For questionsList and answerList )
String question1 = "What does `var` keyword do in Dart?";
String question2 = "Which widget is used for layout in a vertical direction in Flutter?";
String question3 = "What does `setState()` do in Flutter?";
String question4 = "What file is used to manage Dart/Flutter dependencies?";
String question5 = "Which data type is used to store true or false in Dart?";

Map<String,List<String>> questionsList = {
  question1:[    
    'A. Declares a variable with dynamic type',
    'B. Declares a constant',
    'C. Declares a final variable',
    'D. Defines a class'
  ],
  question2:[
    'A. Row',
    'B. Stack',
    'C. Column',
    'D. Container'
  ],
  question3:[
    'A. Resets the app state',
    'B. Builds the entire app again',
    'C. Updates the widget state and triggers a rebuild',
    'D. Logs state changes'
  ],
  question4:[
    'A. manifest.yaml',
    'B. pubspec.yaml',
    'C. flutter.yaml',
    'D. config.yaml'
  ],
  question5:[
    'A. int',
    'B. string',
    'C. bool',
    'D. truthy'
  ],
}; 

Map<String,String> answerList = {
  question1:"A",
  question2:"C",
  question3:"C",
  question4:"B",
  question5:"C",
};

void main(){
  print(totalQuestions);
}