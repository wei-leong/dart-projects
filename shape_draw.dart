// Question: Define an abstract class Shape with abstract methods area() and perimeter(),
//           and a concrete draw() that prints the class name.
// Create classes Circle, Rectangle, Triangle that extend Shape and implement area() and perimeter().
// In main(), instantiate each shape with sample dimensions and add them to a List<Shape>.
// Loop through your List<Shape> and for each shape, print its area, perimeter, and call draw().

import 'dart:io';
import 'dart:math';

abstract class Shape{
  void area(){
    print("The Area : ");
  }
  void perimeter(){
    print("The Perimeter : ");
  }
  void draw(){
    print("Drawing Shape...");
  }
}

class Circle extends Shape{
  double? radius;

  Circle(this.radius);

  @override
  void area(){
    print("Circle Area : ${(radius! * radius!) * pi}");
  }
  void perimeter(){
    print("Circle Area : ${2 * radius! * pi}");
  }
  void draw(){
    print("      *     ");
    print("  *       *  ");
    print("*           * ");
    print("  *       *    ");
    print("      *        ");
  }
}