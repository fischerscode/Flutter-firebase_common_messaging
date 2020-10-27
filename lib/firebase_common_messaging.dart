library flutter_firebase_messaging;

export 'src/firebase_messaging.dart'
    if (dart.library.io) 'src/firebase_messaging_io.dart'
    if (dart.library.js) 'src/firebase_messaging_js.dart';
