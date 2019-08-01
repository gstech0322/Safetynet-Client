import 'package:client/utils/services/new_device_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null) {
      var token;
      
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure();

      token = await _firebaseMessaging.getToken();
      await newDevice(token);

      prefs.setString('token', token);
    }
  }
}
