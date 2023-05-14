import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:times_wire/domain/notification/i_notification_facade.dart';

part 'notification_manager_cubit.freezed.dart';

part 'notification_manager_state.dart';

@injectable
class NotificationManagerCubit extends Cubit<NotificationManagerState> {
  final INotificationFacade _notificationFacade;

  NotificationManagerCubit(this._notificationFacade)
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
}
