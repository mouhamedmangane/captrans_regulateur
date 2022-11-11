import 'package:flutter/material.dart';
import 'package:noppal_util/ui/bounce/npl_tap_bounce.dart';

class ButtonHCard extends StatelessWidget {
  final IconData ? icon;
  final String ? text;
  final Color ? iconBackcolor;
  final Color ? iconColor;
  final Function()? onPressed;

  const  ButtonHCard({this.icon,this.text,this.iconBackcolor,this.iconColor,this.onPressed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NplTapBounce(
      onTap: onPressed!,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(icon!=null)...[
                Ink(
                    child: Icon(icon,color: iconColor,),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: iconBackcolor,
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ],
              if(text!=null)...[
                SizedBox(width: 10,),
                Expanded(child: Text(text!,maxLines: 2,softWrap:true,)),
              ]

            ],
          ),
        ),
      ),
    );
  }
}
