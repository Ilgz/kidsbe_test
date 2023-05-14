import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:times_wire/application/notification/notification_manager_cubit.dart';

class PushNotificationSwitch extends StatelessWidget {
  const PushNotificationSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationManagerCubit, NotificationManagerState>(
      builder: (context, state) {
        return SizedBox(
          width: 40,
          child: Switch(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: Color(0xff475ad7),
            value: state.isEnabled,
            onChanged: (value) {
              context.read<NotificationManagerCubit>().togglePushNotifications();
            },
          ),
        );
      },
    );
  }
}
