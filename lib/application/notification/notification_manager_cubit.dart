import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:times_wire/domain/notification/i_notification_facade.dart';

part 'notification_manager_cubit.freezed.dart';

part 'notification_manager_state.dart';

@injectable
class NotificationManagerCubit extends Cubit<NotificationManagerState> {
  final INotificationFacade _notificationFacade;
  final FirebaseMessaging _firebaseMessaging;
  NotificationManagerCubit(this._notificationFacade,this._firebaseMessaging)
      : super(NotificationManagerState.initial());

  Future<void> togglePushNotifications() async {
    final currentState = state.isEnabled;
    await _notificationFacade.togglePushNotificationsPreference(!currentState);
    emit(state.copyWith(isEnabled: !currentState));
  }

  void initializePushNotifications() {
    emit(state.copyWith(
        isEnabled: _notificationFacade.getPushNotificationsPreference()));
  }
  Future<void> handleInitialNotification({RemoteMessage? initialRemoteMessage})async{
    final remoteMessage =initialRemoteMessage?? await _firebaseMessaging.getInitialMessage();
    //final remoteMessage=RemoteMessage.fromMap({"senderId": null, "category": null, "collapseKey": "com.sail.chat", "contentAvailable": false, "data": {"chat_id": "KMBKMON0JRCcRJFXmNtF"}, "from": "82807448949", "messageId": "0:1679216265046088%41c5030841c50308", "messageType": null, "mutableContent": false, "notification": {"title": "Hello from API", "titleLocArgs": [], "titleLocKey": null, "body": "Cho tam?", "bodyLocArgs": [], "bodyLocKey": null, "android": {"channelId": null, "clickAction": null, "color": null, "count": null, "imageUrl": null, "link": null, "priority": 0, "smallIcon": null, "sound": null, "ticker": null, "tag": null, "visibility": 0}, "apple": null, "web": null}, "sentTime": 1679216265030, "threadId": null, "ttl": 2419200});
    if(remoteMessage!=null) {
      final articleLink=remoteMessage.data["article_link"];
      emit(state.copyWith(articleUrlToNavigate: articleLink));
    }
  }
}
