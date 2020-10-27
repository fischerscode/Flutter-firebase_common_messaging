import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart' as firebase;

typedef Future<dynamic> MessageHandler(Map<String, dynamic> message);

class FirebaseMessaging {
  /// Prompts the user for notification permissions, if needed.
  FutureOr requestNotificationPermissions() {
    return firebase.FirebaseMessaging().requestNotificationPermissions();
  }

  /// Returns the FCM token.
  Future<String> getToken() async {
    return firebase.FirebaseMessaging().getToken();
  }

  /// Sets up [MessageHandler] for incoming messages.
  void configure({
    MessageHandler onMessage,
    MessageHandler onBackgroundMessage,
    MessageHandler onLaunch,
    MessageHandler onResume,
  }) {
    return firebase.FirebaseMessaging().configure(
      onMessage: onMessage,
      onResume: onResume,
      onLaunch: onLaunch,
      onBackgroundMessage: onBackgroundMessage,
    );
  }
}
