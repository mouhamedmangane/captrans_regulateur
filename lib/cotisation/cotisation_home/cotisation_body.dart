import 'package:captrans_regulateur/appbar/my_sliver_app.dart';
import 'package:captrans_regulateur/bloc/cotisation/addcotisation/add_cotisation_bloc.dart';
import 'package:captrans_regulateur/bloc/cotisation/cotisation_en_cours_bloc.dart';
import 'package:captrans_regulateur/bloc/cotisation/total_cotisation_bloc.dart';
import 'package:captrans_regulateur/cotisation/add_cotisation/search_bus_by_mat_page.dart';
import 'package:captrans_regulateur/cotisation/cotisation_home/total_cotisation_card.dart';
import 'package:captrans_regulateur/cotisation/liste_cotisation.dart';
import 'package:captrans_regulateur/receveur/select_receveur_page.dart';
import 'package:captrans_regulateur/receveur/select_receveur_param.dart';
import 'package:captrans_regulateur/util_app/titre/titre_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/select_widget_by_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/ui/croquis/card_croquis.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


import '../../ui/button/button_h_card.dart';

class CotisationBody extends StatelessWidget {

  const CotisationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TotalCotisationBloc>(
          create: (context) => TotalCotisationBloc(SimpleLoadableState(value: 0,state: EnumLoadableState.INIT))..load(),
        ),
        BlocProvider<CotisationEnCoursBloc>(
          create: (context) => CotisationEnCoursBloc(SimpleLoadableState.init())..load(),
        ),

      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CustomScrollView(
          slivers: [
            MySliverApp("Cotisations"),
            SliverToBoxAdapter(
                  child:BlocBuilder<TotalCotisationBloc,SimpleLoadableState<int>>(
                    builder: (context,state) {
                      return SelectWidgetByState.select(
                        state.state,
                        {
                          EnumLoadableState.DONE:TotalCotisationCard(),
                        },
                        parDefaut: CardCroquis(
                          width: double.infinity,
                          height: 127,
                          borderRadius: BorderRadius.circular(20),
                          backgroundColor: Colors.grey.shade300,
                        )
                      );
                    }
                  )


            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: AddCotisationBar(),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: Titre1(' Cotisation en cours'),
              ),
            ),

            // ListCroquisSliver(4,
            //   backgroundColor: Colors.grey.shade300,
            //   shimmerDuration: 1000,
            // ),
            ListeCotisation(),


          ],
        ),
      ),
    );
  }


}

//--------------------------------------------------------------

class AddCotisationBar extends StatelessWidget {
  const AddCotisationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: ButtonHCard(
                icon: Icons.add_business,
                text: "Ajouter  par Selection",
                iconBackcolor: Colors.blue,
                iconColor: Colors.white,
                onPressed: (){
                },
              )
          ),
          SizedBox(width: 20,),
          Expanded(
              child:ButtonHCard(
                      icon: Icons.qr_code_outlined,
                      text: "Ajouter par Qr Code",
                      iconBackcolor: Colors.blue,
                      iconColor: Colors.white,
                      onPressed: ()async{
                        String matricule = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
                        matricule="DK976529";
                        print(matricule);
                        if(true){
                          Navigator.pushNamed(context, SearchBusByMatPage.routeName,
                              arguments: SearchBusByMatParam(
                                  matricule: matricule,
                                  onValidate: (context,bus){
                                    print('ok');
                                    Navigator.pushReplacementNamed(context, SelectReceveurPage.routeName,arguments:
                                    SelectReceveurParam(bus: bus));
                                  })
                          );
                        }
                        else{
                          Navigator.pop(context);
                        }

                      },
                    )
          ),
        ],
      ),
    );
  }
}
