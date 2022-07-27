import 'package:flutter/material.dart';

class insert extends StatelessWidget {
  String str = '';
  insert({Key? key, required this.str}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(str),

    ),
    ) ;
  }
}
