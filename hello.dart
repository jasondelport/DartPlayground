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
  // const are implicitly final
  const bar = 1000000;
  
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
  
  double z = 1; // automatically converted to double, Equivalent to double z = 1.0.
  
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
 
}