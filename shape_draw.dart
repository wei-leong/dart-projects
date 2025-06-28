// Question: Define an abstract class Shape with abstract methods area() and perimeter(),
//           and a concrete draw() that prints the class name.
// Create classes Circle, Rectangle, Triangle that extend Shape and implement area() and perimeter().
// In main(), instantiate each shape with sample dimensions and add them to a List<Shape>.
// Loop through your List<Shape> and for each shape, print its area, perimeter, and call draw().

import 'dart:io';
import 'dart:math';

void main(){
  Circle circle = new Circle(10);
  circle.area();
  circle.perimeter();
  circle.draw();

  Rectangle rectangle = new Rectangle(20, 60);
  rectangle.area();
  rectangle.perimeter();
  rectangle.draw();
}
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

class Rectangle extends Shape{
  double? width;
  double? length;

  Rectangle(this.width,this.length);

  @override
  void area(){
    print("Rectangle Area : ${width! * length!}");
  }
  void perimeter(){
    print("Rectangle Area : ${2 * (length! * width!)}");
  }
  void draw(){
    int horizontalLimit = length!.toInt();
    int verticalLimit = width!.toInt();
    for(int i = 0 ; i < verticalLimit ; i ++){
      if( i == 0 || i ==  verticalLimit - 1){
        for(int j = 0 ; j < horizontalLimit ; j++){
          stdout.write("*");
        }
        print("");
      }else{
        for(int j = 0 ; j < horizontalLimit ; j++){
          if(j == 0 || j ==  horizontalLimit - 1){
            stdout.write("*");
          }else{
            stdout.write(" ");
          }
        }
        print("");
      }
    }
  }
}