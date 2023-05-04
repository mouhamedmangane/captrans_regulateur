import 'package:captrans_regulateur/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class LineNp{
  String key;
  LineNp(this.key);

  foreground(RemoteMessage remoteMessage);

  background(RemoteMessage remoteMessag);

  showForground(RemoteNotification notification){
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: 'launch_background',
          ),
        ));
  }

}