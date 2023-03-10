/**
 * 1. Buatlah sebuah program berdasarkan class Shape, Circle, Square, Rectangle 
 * Kriteria dari program yang dibuat adalah sebagai berikut:

- Buat class beserta interface sesuai dengan class diagram diatas.
- Method `getArea()` digunakan untuk menghitung luas bangun datar.
- Method `getPerimeter()` digunakan untuk menghitung keliling bangun datar.
- Output yang harus ditampilkan adalah luas dan keliling untuk tiga bangun datar berdasarkan di class diagram.
*/

//* membuat class Shape dan method getArea() & getPerimeter()
class Shape {
  num getArea() {
    return 0;
  }

  num getPerimeter() {
    return 0;
  }
}

//* membuat class Circle. interface dari class Shape
class Circle implements Shape {
  Circle({required this.radius});
  late num radius;
  final double phi = 3.14;

  @override
  num getArea() {
    // A = π x r^2
    return (phi * (radius * radius));
  }

  @override
  num getPerimeter() {
    // K = 2 x π x r
    return (2 * phi * radius);
  }
}

//* membuat class Square. interface dari class Shape
class Square implements Shape {
  Square({required this.side});
  late num side;

  @override
  num getArea() {
    // A = s^2
    return side * side;
  }

  @override
  num getPerimeter() {
    // K = 4 x s
    return 4 * side;
  }
}

//* membuat class Rectangle. interface dari class Shape
class Rectangle implements Shape {
  Rectangle({required this.height, required this.width});
  late num width;
  late num height;

  @override
  num getArea() {
    // A = p x l
    return height * width;
  }

  @override
  num getPerimeter() {
    // K = 2 x (p + l)
    return (2 * (height + width));
  }
}

void main() {
  final circle = Circle(radius: 6);
  final square = Square(side: 5);
  final rectangle = Rectangle(height: 5, width: 7);

  print("Circle Area ${circle.radius} = ${circle.getArea()}");
  print("Circle Perimeter ${circle.radius} = ${circle.getPerimeter()}");
  print("\nSquare Area ${square.side} = ${square.getArea()}");
  print("Square Perimeter ${square.side} = ${square.getPerimeter()}");
  print(
      "\nRectangle Area ${rectangle.height} & ${rectangle.width} = ${rectangle.getArea()}");
  print(
      "Rectangle Perimeter ${rectangle.height} & ${rectangle.width} = ${rectangle.getPerimeter()}");
}
