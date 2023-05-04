
import 'package:captrans_regulateur/notification_fcm/Line_np.dart';
import 'package:captrans_regulateur/notification_fcm/line_np_default_impl.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CenterNp {
  List<LineNp> lines=[];
  AndroidNotificationChannel ? channel;

  CenterNp({required this.lines,this.channel});


  LineNp _selecteNp(RemoteMessage event){
    print(event.toMap());
    return lines.firstWhere(
            (element) => element.key == event.data['name'],
        orElse: ()=> LineNpDefaultImpl('INFO')
    );
  }
  makeBack(RemoteMessage event){
    print('back -------------------------------');
    LineNp lineNp=_selecteNp(event);
    lineNp.background(event);
  }

  makeFront(RemoteMessage event){
    print('front -------------------------------');
    LineNp lineNp=_selecteNp(event);
    print(lineNp);
    lineNp.foreground(event);

  }
}