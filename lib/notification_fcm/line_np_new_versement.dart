
import 'package:captrans_regulateur/notification_fcm/Line_np.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LineNpNewVersement extends LineNp{
  LineNpNewVersement(super.key);

  @override
  background(RemoteMessage remoteMessag) {
    print('background new versement -----------------------------');

  }

  @override
  foreground(RemoteMessage remoteMessage) {
    RemoteNotification? notification = remoteMessage.notification;
    showForground(notification!);
    print('forground new versement -----------------------------');

  }


}
