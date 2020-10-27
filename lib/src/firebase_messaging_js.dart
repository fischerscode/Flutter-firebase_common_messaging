import 'dart:async';

import 'package:firebase/firebase.dart' as firebase;

typedef Future<dynamic> MessageHandler(Map<String, dynamic> message);

class FirebaseMessaging {
  firebase.Messaging _messaging;

  FirebaseMessaging() {
    _messaging = firebase.messaging();
  }

  /// Prompts the user for notification permissions, if needed.
  FutureOr requestNotificationPermissions() {
    return _messaging.requestPermission();
  }

  /// Returns the FCM token.
  Future<String> getToken() async {
    return _messaging.getToken();
  }

  /// Sets up [MessageHandler] for incoming messages.
  void configure({
    MessageHandler onMessage,
    MessageHandler onBackgroundMessage,
    MessageHandler onLaunch,
    MessageHandler onResume,
  }) {
    if (onMessage != null) {
      _messaging.onMessage.listen((firebase.Payload payload) => onMessage(
            _buildMessage(payload),
          ));
    }

    if (onBackgroundMessage != null) {
      _messaging.onBackgroundMessage
          .listen((firebase.Payload payload) => onBackgroundMessage(
                _buildMessage(payload),
              ));
    }
  }

  Map<String, dynamic> _buildMessage(firebase.Payload payload) {
    return {
      'notification': {
        'title': payload?.notification?.title,
        'body': payload?.notification?.body,
      },
      'data': payload.data,
    };
  }
}
