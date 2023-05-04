import 'package:flutter/material.dart';

class CleValeurView extends StatelessWidget {
  final Widget cle;
  final Widget valeur;
  final IconData ? icon;
  final Function() ? onTap;
  const CleValeurView({ required this.cle,required this.valeur,this.icon,this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title:cle,
      trailing: valeur,
      leading: (icon != null)? Icon(icon):null,
    );
  }
}
