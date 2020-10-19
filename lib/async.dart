import 'dart:async';

// main method needs to be async
void main() async {
  print('start');
  future().then((value) => print(value));
  print("future -> ${future()}");
  print(await future());
  print('end');
}

Future future() async {
  //return Future.value("future");
  return Future.delayed(Duration(seconds: 2), () => "future");
}
