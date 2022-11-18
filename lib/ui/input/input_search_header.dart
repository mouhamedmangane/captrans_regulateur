

import 'package:flutter/material.dart';

class InputSearchHeader extends StatefulWidget {
  final TextEditingController ? controller;
  final Function(String) ?  onChange;
  final String ? hintText;
  const InputSearchHeader({
    this.controller,
    this.onChange,
    this.hintText,
    Key? key
  }) : super(key: key);

  @override
  State<InputSearchHeader> createState() => _InputSearchHeaderState();
}

class _InputSearchHeaderState extends State<InputSearchHeader> {

  bool editing=false;

  @override
  Widget build(BuildContext context) {
    return  TextField(
        controller: widget.controller,
        autofocus: true,
        onChanged: (text){
          setState(() {
            editing=text.isNotEmpty;
          });
          if(widget.onChange != null)
            widget.onChange!(text);
        },
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.all(30),
          fillColor: Colors.grey.shade300,
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: widget.hintText,
          suffixIcon: (editing)
                      ?IconButton(
                          onPressed: (){
                            if(widget.controller!=null){
                              widget.controller!.text="";
                              if(widget.onChange!=null )widget.onChange!('');
                              setState(() {
                                editing=false;
                              });
                            }

                          }, icon: Icon(Icons.close,color:Colors.grey.shade600)
                      ):null,

        ),
      );
  }
}
