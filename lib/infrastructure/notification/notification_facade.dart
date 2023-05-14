import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:times_wire/domain/notification/i_notification_facade.dart';
import 'package:shared_preferences/shared_preferences.dart';
@LazySingleton(as: INotificationFacade)
class NotificationFacade implements INotificationFacade {
  final SharedPreferences _sharedPreferences;
  NotificationFacade(this._sharedPreferences);
  @override
  Future<Unit> togglePushNotificationsPreference(bool isEnabled) async {
    await _sharedPreferences.setBool('push_notifications_enabled', isEnabled);
    return unit;
  }
  @override
  bool getPushNotificationsPreference() {
    final isEnabled=_sharedPreferences.getBool('push_notifications_enabled')??true;
    return isEnabled;
  }
}
