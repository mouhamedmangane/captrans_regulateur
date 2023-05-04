import 'package:flutter/material.dart';

class CadreVerticalView extends StatelessWidget {
  final Widget header;
  final Widget body;
  final Color ? backColor;
  final Color ? borderColor;
  const CadreVerticalView({required this.header,required this.body,this.backColor,this.borderColor,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backColor,
      shape: RoundedRectangleBorder(
        side: borderColor==null?BorderSide.none:BorderSide(color: borderColor! ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 15,right:15,top: 20,bottom: 10),
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header,
            const SizedBox(height: 8,),
            body
          ],
        ),
      ),
    );
  }
}

class CadreVerticalTextView extends StatelessWidget {
  final String headerText;
  final String ? bodyText;
  final Color ? backColor;
  final Color ? foreColorHeader;
  final Color ? foreColorBody;
  final Color ? borderColor;
  final double ? fontSizeHeader;
  final double ? fontSizeBody;
  final Widget ? body;
  CadreVerticalTextView({
    required this.headerText,
    this.bodyText,
    this.backColor,
    this.foreColorHeader,
    this.foreColorBody,
    this.borderColor,
    this.fontSizeHeader,
    this.fontSizeBody,
    this.body,
    Key? key
  }) : super(key: key){
    assert(body!=null || bodyText!=null);
  }

  @override
  Widget build(BuildContext context) {
    return CadreVerticalView(
        borderColor: borderColor,
        backColor: backColor,
        header: Text(headerText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: fontSizeHeader??20,color: foreColorHeader),),
        body: body==null
              ? Text(bodyText!,style: TextStyle(fontSize: fontSizeBody ?? null,color: foreColorBody ?? Colors.grey.shade700,height: 1.2),overflow: TextOverflow.ellipsis,maxLines: 3,)
              : body!,
    );
  }
}

