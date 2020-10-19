import 'dart:math' as Math;

void printInteger(int number) {
  print('The number is $number.');
}

void main() {
  // commenting and printing
  var name = 'Voyager I';
  print('Hello, $name!');
  print('Hello, ${name.toUpperCase()}!');
  var number = 42;
  // basic method
  printInteger(number);

  // dynamically typed
  var name0 = 'Bob';
  dynamic name1 = 'Bob';
  Object name2 = 'Bob';
  // statically typed with type annotation
  String name3 = 'Bob';

  print('$name0 $name1 $name2 $name3');

  int lineCount;
  // Production code ignores the assert() call.
  assert(lineCount == null);

  // can't be changed
  final name4 = 'Bob';
  // causes error
  // name4 = 'Alice';

  // compile-time constants
  // If the const variable is at the class level, mark it static const
  // Const variables are implicitly final
  const bar = 1000000;

  // can use it to create constant values
  // as well as to declare constructors that create constant values
  // Any variable can have a constant value.
  final bar1 = const [];
  const baz = []; // Equivalent to `const []`
  // illegal
  // baz = [1, 2, 3];

  var foo = const [];
  foo = [1, 2, 3]; // this is legal

  // Valid compile-time constants as of Dart 2.5.
  const Object i = 3; // Where i is a const Object with an int value...
  const list = [i as int]; // Use a typecast.
  const map = {if (i is int) i: "int"}; // Use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.

  double z =
      1; // automatically converted to double, Equivalent to double z = 1.0.

  // CONVERSIONS of types

  // String -> int
  var one = int.parse('1');
  assert(one == 1);

  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  // STRINGS
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  // concaternation
  var s1a = 'String '
      'concatenation'
      " works even over line breaks.";
  assert(s1a ==
      'String concatenation works even over '
          'line breaks.');

  var s2a = 'The + operator ' + 'works, as well.';
  assert(s2a == 'The + operator works, as well.');

  var s1b = '''
  You can create
  multi-line strings like this one.
  ''';

  var s2b = """This is also a
  multi-line string.""";

  // Check for an empty string.
  var fullName = '';
  assert(fullName.isEmpty);

  // Check for zero.
  var hitPoints = 0;
  assert(hitPoints <= 0);

  // Check for null.
  var unicorn;
  assert(unicorn == null);

  // Check for NaN.
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);

  // LISTS

  var list1 = [1, 2, 3];
  assert(list1.length == 3);
  assert(list1[1] == 2);

  list1[1] = 1;
  assert(list1[1] == 1);
  print(list1);
  // spread operator
  var list2 = [0, ...list1];
  assert(list2.length == 4);
  print(list2);

  // null-aware spread operator
  var list4;
  //var list3 = [-1, ...list4]; // breaks
  var list3 = [-1, ...?list4]; // doesn't break
  print(list3);

  // TYPES
  // Object is parent of all types and classes

  num val = 5; // num type is parent to int and double
  int val1 = 6;
  double val2 = 5.3;
  print("sum -> ${val + val1 + val2}");

  bool b = true;

  var c = MyClass(4, 5);
  c.num1 = 4;
  c.num2 = 5;

  print(c);
  print(c.toString());

  // cascade operator
  var c1 = MyClass(6, 7)
    ..num1 = 5
    ..num2 = 6;

  var c3 = MyClass1(12, 10);
  // private methods and constructors break!
  // c3.privateMethod(); breaks!!
  // var breaks = MyClass1(2);
  print(c3.num2); // uses the getter method!!
  c3.num2 = 22; // uses the setter method
  print(c3.num2); // uses the getter method!!

  var c2 = MyClass2.num1(10);
  print(c2);
  print(c2.toString());

  var a1 = MyClass1(12, 12);
  var a2 = MyClass1(12, 12);
  print("sum -> ${a1 + a2}");
  print(a1.customMethod(a2));
  print(MyClass1.subtract(a1, a2));
  print(MyClass1.counter);
  print(MyExtendedClass(4, 5, 6));

  print(Math.pi); // from the imported math library
  Math.Random random = Math.Random();
  num rand = random.nextInt(4);
  //print(rand);
  switch (rand) {
    case 0:
      print('zero');
      break;
    case 1:
      print('one');
      break;
    case 2:
      print('two');
      break;
    default:
      print('what what');
  }

  A cla = C();
  cla.hi();
  // casting
  (cla as C).hello();
  (cla as C).printTimeStamp();

  // anonynous function
  () {
    print('anon');
  }();

  () => print('anon2'); // this does nothing and throws no error

  // COLLECTIONS

  List<int> intL = [1, 2, 3, 4, 5, 6, 7];
  print(intL[0]);
  for (int i in intL) {
    //print(i);
  }

  intL.forEach((element) {
    //print(element);
  });

  //intL.forEach((i) => print(i));
  var even = (i) => i.isEven;
  print(intL.first); // first element
  print(intL.last); // last element
  print("skip -> ${intL.skip(3)}");
  print(
      "where -> ${intL.where((i) => even(i))}"); // like filter in other functional langs
  print("map -> ${intL.take(10).map((i) => i * 2)}");
  print("take While -> ${intL.takeWhile((i) => i < 4)}");
  print("take -> ${intL.take(2)}");
  print("any -> ${intL.any((i) => i % 2 == 0)}");
  print("every -> ${intL.every((i) => i % 2 == 0)}");
  print(
      "reduce -> ${intL.reduce((prev, i) => prev + i)}"); // add them all together
  print(intL.reduce(Math.min)); // ignores order
  print(intL.reduce(Math.max)); // ignores order

  Map<int, int> ma = Map.fromIterable(intL.take(10));
  print(ma);
  print(ma.map((int k, int v) => MapEntry(k, k + v)));
} // end main

// CLASSES

class MyClass {
  num num1, num2;

  MyClass(num num1, num num2) {
    this.num1 = num1;
    this.num2 = num2;
  }
}

// you can only inherit from one class but you can use implement
class MyExtendedClass extends MyClass {
  num num3;

  MyExtendedClass(num num1, num num2, this.num3) : super(num1, num2);
}

class MyClass1 {
  num _num1; // private field
  num _num2; // private field
  static num counter = 0;

  num getNum1() {
    return _num1;
  }

  void setNum1(num num1) {
    this._num1 = num1;
  }

  void _privateMethod() {
    // a private method
  }

  // private constructor
  MyClass1._(num num1) {
    this._num1 = num1;
  }

  get num2 => _num2;
  set num2(num val) => _num2 = val;

  MyClass1 operator +(MyClass1 c) {
    return MyClass1(this._num1 + c.getNum1(), this._num2 + c.num2);
  }

  MyClass1 customMethod(MyClass1 c) {
    return MyClass1(this._num1 * c.getNum1(), this._num2 * c.num2);
  }

  static MyClass1 subtract(MyClass1 c, MyClass1 c1) {
    return MyClass1(c.getNum1() - c1.getNum1(), c.num2 - c1.num2);
  }

  MyClass1(num num1, num num2) {
    this._num1 = num1;
    this._num2 = num2;
    counter = counter + 1;
  }

  @override
  String toString() {
    return "$_num1 + $_num2";
  }
}

class MyClass2 {
  num _num1;
  num _num2;

  MyClass2(this._num1, this._num2);

  MyClass2.num1(num val) : this(val, 0);

  @override
  String toString() {
    return "$_num1 + $_num2";
  }
}

// cannot instatiate abstract classes but you can use them as a type
abstract class House {
  String get name;
}

class MyHouse extends House {
  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
}

class A {
  void hi() {
    print('hi');
  }
}

class B {
  void hello() {
    print('hello');
  }
}

// Mixins uses the WITH keyword
// must implement entire interface of A and B
class C with TimeStamp implements A, B {
  @override
  void hello() {
    // TODO: implement hello
  }

  @override
  void hi() {
    // TODO: implement hi
  }
}

class TimeStamp {
  DateTime now = DateTime.now();
  void printTimeStamp() {
    print(now);
  }
}
