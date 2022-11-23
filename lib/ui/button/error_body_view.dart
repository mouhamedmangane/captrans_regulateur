

import 'package:flutter/material.dart';

class ErrorBodyView extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String message;
  final IconData icon;
  final double topPadding;
  const ErrorBodyView({
    required this.onTap,
    required this.title,
    required this.message,
    this.icon=Icons.question_mark,
    this.topPadding=0,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon,size: 75,color: Colors.grey.shade300,),
            SizedBox(height: 10,),
            Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
            SizedBox(height: 5,),
            Text(message,style: TextStyle(fontSize: 16,color: Colors.grey.shade600),textAlign: TextAlign.center),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: onTap,
                child: Text('Réessayer'),
            )
          ],
        ),
      ),
    );
  }
}
