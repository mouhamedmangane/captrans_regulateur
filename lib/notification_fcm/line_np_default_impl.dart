
import 'package:captrans_regulateur/notification_fcm/Line_np.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LineNpDefaultImpl extends LineNp{
  LineNpDefaultImpl(super.key);

  @override
  background(RemoteMessage remoteMessag) {

  }

  @override
  foreground(RemoteMessage remoteMessage) {
    RemoteNotification? notification = remoteMessage.notification;
    showForground(notification!);
  }


}
