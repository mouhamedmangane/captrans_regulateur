import 'package:captrans_regulateur/bus/search_bus_by_mat_page.dart';
import 'package:captrans_regulateur/bus/search_bus_page.dart';
import 'package:captrans_regulateur/bus/search_bus_param.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:noppal_util/ui/bounce/npl_tap_bounce.dart';
import 'package:noppal_util/ui/link/searchLInk.dart';

import 'detail_bus_page.dart';


class BusBody extends StatefulWidget {

  const BusBody({Key? key}) : super(key: key);

  @override
  State<BusBody> createState() => _BusBodyState();
}

class _BusBodyState extends State<BusBody> {
  final  GlobalKey _key= GlobalKey();
  TextEditingController _controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus'),
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: Colors.grey.shade50,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          //primary: true,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _searchInput(context),
            Expanded(child: _infoPage()),
            //SearchBusButton(key: _key,),

            //ListeBus(),
          ],
        ),
      ),
    );
  }

  Widget _searchInput(BuildContext context){
    return SearchLInk(
      "Recherche bus ...",
      height: 50,
      leading: Padding(
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.search,color:Colors.blue.shade50,size: 25),
      ),
      background: Colors.blue,
      textColor: Colors.blue.shade100,
      borderColor: Colors.transparent,
      onTap: (){
        Navigator.pushNamed(context, SearchBusPageArg.routeName,
            arguments: SearchBusParam(onSelect: (context,bus){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>BusDetailCotisationPage(bus: bus)));

            }));
      },
      actions: [
        NplTapBounce(
          child: Icon(Icons.qr_code,size: 25,color: Colors.white,),
          onTap: () async {
            String matricule = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
            matricule="DK976529";
            print(matricule);
            if(true){
              Navigator.pushNamed(context, SearchBusByMatPage.routeName,
                  arguments:_paramSearch(matricule,canResacn: true)
              );
            }
            else{
              Navigator.pop(context);
            }

          },
        )
      ],
    );

  }

  SearchBusByMatParam _paramSearch(matricule,{canResacn=false}){
    return  SearchBusByMatParam(
        matricule: matricule,
        canRescan: canResacn,
        onValidate: (context,bus){
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>BusDetailCotisationPage(bus: bus)));
          // Navigator.pushReplacementNamed(
          //     context,
          //     SelectReceveurPage.routeName,
          //     arguments: SelectReceveurParam(bus: gBus
          //
          //     )
          // );
        });
  }


  Widget _infoPage(){

    Color color=Colors.grey.shade500;
    return Center(
        child:Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget>[
                      Icon(Icons.search,color:Colors.grey.shade500,size: 60,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0,vertical:0),
                        child:  Text('ou',style: TextStyle(color: color,fontSize: 24),),
                      ),
                      Icon(Icons.qr_code,color: Colors.grey.shade500,size: 60,),
                    ]
                ),
                const SizedBox(height: 15,),
                Text("Chercher un bus par scan en appuyant sur le bouton scan en haut à droite, ou par saisir en appuyant sur la barre de recherche",
                  style: TextStyle(color: color,fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ]
          ),
        )
    );
  }

}
