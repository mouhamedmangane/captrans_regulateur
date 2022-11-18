

import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/model/user.dart';
import 'package:captrans_regulateur/modelDataTest/user_data.dart';
import 'package:noppal_util/model/gen_data_array_impl.dart';
import 'package:noppal_util/model/gen_date_time.dart';
import 'package:noppal_util/model/gen_id.dart';
import 'package:noppal_util/model/gen_nom.dart';
import 'package:noppal_util/model/gen_nombre.dart';

class NomGieData extends GenDataArrayImpl<String>{




  @override
  List<String> getData() {
      return[
        'Nayobe','Darou Salam',"Avenue Senegal","Diamageun",'Niambour','Diampalanté',
      ];
  }
}