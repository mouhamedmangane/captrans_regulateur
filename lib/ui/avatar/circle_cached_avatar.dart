import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class CircleCachedAvatar extends StatefulWidget {
  final String urlDistant;
  final double raduis;
  const CircleCachedAvatar({required this.urlDistant,this.raduis=25,Key? key}) : super(key: key);

  @override
  State<CircleCachedAvatar> createState() => _CircleCachedAvatarState();
}

class _CircleCachedAvatarState extends State<CircleCachedAvatar> {

  late bool hasFailled;
  int counter=0;
  @override
  void initState() {
    hasFailled=true;
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 1000), () {
      setState((){
        hasFailled=false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.raduis+30,
      height: widget.raduis+30,
      child: Stack(

        children: [
          Align(
            alignment: Alignment.center,
            child: noImage(),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: CachedNetworkImageProvider(
                  widget.urlDistant,
                  errorListener:(){

                  }
              ),
              radius: widget.raduis,
            ),
          )

        ],
      ),
    );
  }



  Widget noImage(){
    return CircleAvatar(
        radius: widget.raduis,
        backgroundImage: Image.asset( 'asset/images/person.png',width: 220, height: 220,).image,
        backgroundColor: Colors.white
    );
  }
}
