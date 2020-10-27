import 'package:logging/logging.dart';
import 'package:intl/intl.dart' show DateFormat;

void main() {
  // singletons are good for caches!!!

  // eager initialization, instance of class is created at the time of class loading
  EagerInitializedSingleton esi = EagerInitializedSingleton.getInstance();

  // lazy initialization, only created when requested
  LazyInitializedSingleton lis = LazyInitializedSingleton.getInstance();

  // factory singlton
  FactorySingleton fs = FactorySingleton();

  // the dart way
  final singleton = Singleton.instance;

  final singletonFactory = SingletonFactory();

  final logger = DebugLogger();

  logger.log("test");
}

class EagerInitializedSingleton {
  static final EagerInitializedSingleton _instance =
      EagerInitializedSingleton._internal();

  EagerInitializedSingleton._internal();

  static EagerInitializedSingleton getInstance() {
    return _instance;
  }
}

class Singleton {
  static Singleton _instance;
  static get instance {
    if (_instance == null) {
      _instance = Singleton._internal();
    }

    return _instance;
  }

  Singleton._internal();
}

class SingletonFactory {
  static SingletonFactory _instance;

  SingletonFactory._internal() {
    _instance = this;
  }

  factory SingletonFactory() => _instance ?? SingletonFactory._internal();
}

class LazyInitializedSingleton {
  static LazyInitializedSingleton _instance;
  LazyInitializedSingleton._internal();

  static LazyInitializedSingleton getInstance() {
    if (_instance == null) {
      _instance = LazyInitializedSingleton._internal();
    }
    return _instance;
  }
}

class FactorySingleton {
  static final FactorySingleton _instance = FactorySingleton._internal();

  factory FactorySingleton() {
    return _instance;
  }

  FactorySingleton._internal();
}

class DebugLogger {
  static DebugLogger _instance;
  static Logger _logger;
  static final _dateFormatter = DateFormat('H:m:s.S');
  static const appName = 'my_app';

  DebugLogger._internal() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(_recordHandler);

    _logger = Logger(appName);

    _instance = this;
  }

  factory DebugLogger() => _instance ?? DebugLogger._internal();

  void _recordHandler(LogRecord rec) {
    print('${_dateFormatter.format(rec.time)}: ${rec.message}');
  }

  void log(message, [Object error, StackTrace stackTrace]) =>
      _logger.info(message, error, stackTrace);
}
