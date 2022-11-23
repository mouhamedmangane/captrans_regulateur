import 'package:flutter/material.dart';

class LoadingBodyView extends StatelessWidget {
  final double verticalPadding;
  const LoadingBodyView({this.verticalPadding=0,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
