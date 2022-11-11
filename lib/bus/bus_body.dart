import 'package:captrans_regulateur/appbar/my_sliver_app.dart';
import 'package:captrans_regulateur/bus/liste_bus.dart';
import 'package:captrans_regulateur/bus/search_bus_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:noppal_util/ui/link/searchLInk.dart';

class BusBody extends StatefulWidget {

  const BusBody({Key? key}) : super(key: key);

  @override
  State<BusBody> createState() => _BusBodyState();
}

class _BusBodyState extends State<BusBody> {
  final  GlobalKey _key= GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        primary: true,
        slivers: [
          MySliverApp("Bus",
            actions: [
              IconButton(
                  onPressed: (){
                  },
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.qr_code_outlined,color: Colors.blue,)
              ),
            ],
          ),
          SearchBusButton(key: _key,),

          ListeBus(),
        ],
      ),
    );
  }
}
