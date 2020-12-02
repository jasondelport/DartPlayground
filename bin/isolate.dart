import 'dart:isolate';
import 'dart:io';

void main() {
  print('start');
  Isolate.spawn(messenger, "hello isolate");
  ReceivePort receivePort = ReceivePort();
  receivePort.listen((data) {
    print(data);
    if (data.contains("ended")) {
      receivePort.close();
    }
  });
  Isolate.spawn(sendBack, receivePort.sendPort);
  print('end');
}

void messenger(String message) {
  print("from thread -> $message");
}

void sendBack(SendPort sendPort) {
  sendPort.send("started -> ${DateTime.now().second}");
  sleep(const Duration(seconds: 5));
  sendPort.send("ended -> ${DateTime.now().second}");
}
