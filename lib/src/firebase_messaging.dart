import 'dart:async';

typedef Future<dynamic> MessageHandler(Map<String, dynamic> message);

class FirebaseMessaging {
  /// Prompts the user for notification permissions, if needed.
  FutureOr requestNotificationPermissions() {
    throw UnsupportedError("Stub!");
  }

  /// Returns the FCM token.
  Future<String> getToken() async {
    throw UnsupportedError("Stub!");
  }

  /// Sets up [MessageHandler] for incoming messages.
  void configure({
    MessageHandler onMessage,
    MessageHandler onBackgroundMessage,
    MessageHandler onLaunch,
    MessageHandler onResume,
  }) {
    throw UnsupportedError("Stub!");
  }
}
