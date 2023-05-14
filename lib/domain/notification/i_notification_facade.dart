import 'package:dartz/dartz.dart';
abstract class INotificationFacade {
  Future<Unit> togglePushNotificationsPreference(bool isEnabled);
  bool getPushNotificationsPreference();
}
