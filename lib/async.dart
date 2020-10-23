import 'dart:async';
import 'dart:convert';
import 'dart:io';

// main method needs to be async
void main() async {
  print('start');
  future().then((value) => print(value));
  print("future -> ${future()}");
  print(await future());
  print('end');
  
  addAsync(30).then((x) => x(50),).then((y) => print(y),);
  
  Function x = await addAsync(30);
  int z = await x(50);
  print(z); 
  
  Stream stream = exampleStream(20);
  await for (var s in stream) {
	  print("Number: $s");
  } 
  
  // anonymous function, lambda & closure are all the same thing
  exampleStream(20).listen((int x) => print("Number -> $x"));
  
  File fileWrite = File("test.txt");
  IOSink sink = fileWrite.openWrite(mode: FileMode.append);
  sink.add(utf8.encode("Hello world!\n"));
  await sink.flush();
  await sink.close();
  
  
  File fileRead = File("test.txt");
  // asBroadcastStream allows multiple listeners
  Stream<List<int>> fileStream = fileRead.openRead().asBroadcastStream(); 
  fileStream.transform(utf8.decoder).transform(LineSplitter())
  .listen((str) => print(str),
  onDone: () => print('done reading file'), // optional
  onError: (e) => print(e.toString())); // optional
  
  fileStream.listen((byte) => print(byte));
  
}

Stream<int> exampleStream(int x) async* {
	for (int i = 0; i <= x; i++) {
		yield i;
	}
}

Future<Function> addAsync(int x) async {
	return (int y) async => x + y; // closure
}

Future future() async {
  //return Future.value("future");
  return Future.delayed(Duration(seconds: 2), () => "future");
}
