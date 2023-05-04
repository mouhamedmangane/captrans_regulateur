import 'package:flutter/material.dart';

class MySliverApp extends StatelessWidget {
  final String titre;
  final List<Widget> ? actions;
  final Widget ? leading;
  final int additionalHeigth;
  const MySliverApp(this.titre,{this.actions,this.leading,this.additionalHeigth=0,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        leading: leading,
        elevation: 1,
        backgroundColor: Colors.grey.shade200,
        foregroundColor: Colors.black,
        title: Text(titre),
        floating: false,
        automaticallyImplyLeading: true,
        pinned: true,

        // flexibleSpace: FlexibleSpaceBar(
        //
        //   title:Row(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children:<Widget> [
        //       Text(titre,style: TextStyle(color: Colors.black),),
        //       Spacer()
        //     ]+((actions!=null)?actions!:[]),
        //   ) ,
        //   centerTitle: false,
        //   titlePadding: EdgeInsets.only(bottom: 15,top: 10),
        // ),

            //UserAvatarButton(),

    );
  }
}
