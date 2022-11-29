import 'package:flutter/material.dart';

class PhotoProfilView extends StatelessWidget {
  const PhotoProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(width: 2,color: Colors.grey.shade50),
                borderRadius: BorderRadius.circular(92,)
            ),
            child: ClipOval(
              child: Image.asset("asset/user/2.jpeg",
                width: 90,
                height: 0,fit:
                BoxFit.cover,
              ),
            ),
          ),

          Positioned(
              bottom: 0,
              right: -25,
              child: RawMaterialButton(
                onPressed: () {
                },
                elevation: 2.0,
                fillColor: Color(0xFFF5F6F9),
                child: Icon(Icons.camera_alt_outlined, color: Colors.blue,),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ))
        ],
      ),
    );
  }
}
