
import 'package:captrans_regulateur/notification_fcm/Line_np.dart';
import 'package:captrans_regulateur/repository/user/user_local_repo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LineNpDeconnexion extends LineNp{
  LineNpDeconnexion(super.key);

  @override
  background(RemoteMessage remoteMessag) {
    UserLocalRepo().cleanAll();
  }

  @override
  foreground(RemoteMessage remoteMessage) {
    RemoteNotification? notification = remoteMessage.notification;
    showForground(notification!);
    UserLocalRepo().cleanAll();
  }


}
