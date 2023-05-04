
import 'package:captrans_regulateur/notification_fcm/Line_np.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LineNpNewCollecte extends LineNp{
  LineNpNewCollecte(super.key);

  @override
  background(RemoteMessage remoteMessag) {
    print('background new collecte -----------------------------');

  }

  @override
  foreground(RemoteMessage remoteMessage) {
    RemoteNotification? notification = remoteMessage.notification;
    showForground(notification!);
    print('forground new collecte -----------------------------');

  }


}
