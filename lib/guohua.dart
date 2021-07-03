import 'package:flutter/material.dart';

class  guohua extends StatelessWidget {
  final String title;

  const guohua({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(body:Center(child:Container(
        color: Colors.white,
      height: 270.0,
      width:370.0,
        child: Image.network(this.title,
        fit:BoxFit.fitWidth,
    ))));

  }
}
