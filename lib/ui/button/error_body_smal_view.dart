

import 'package:flutter/material.dart';

class ErrorBodySmallView extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String message;
  final IconData icon;
  final double topPadding;
  final Color ? colorIcon;
  final Color ? colorText;
  final Color ? backgroundButton;
  final Color ? colorTextButton;
  const ErrorBodySmallView({
    required this.onTap,
    required this.title,
    required this.message,
    this.icon=Icons.file_download_off,
    this.topPadding=0,
    this.colorIcon,
    this.colorText,
    this.backgroundButton,
    this.colorTextButton,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding,bottom: 15,left: 50,right: 30),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon,size: 40,color: colorIcon??Colors.grey.shade300,),
            SizedBox(height: 10,),
            Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:colorText ?? Colors.grey.shade600)),
            SizedBox(height: 5,),
            Text(message,style: TextStyle(fontSize: 14,color: colorText ?? Colors.grey.shade600),),
            SizedBox(height: 10,),
            ElevatedButton(

              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(backgroundButton,),
                shadowColor: MaterialStateProperty.all(backgroundButton),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                )
              ),
              onPressed: onTap,
              child: Text('Réessayer',style: TextStyle(color: colorTextButton),),
            )
          ],
        ),
      ),
    );
  }
}
