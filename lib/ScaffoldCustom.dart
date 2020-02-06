import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldCustom extends StatelessWidget {
  var body;

  ScaffoldCustom({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("TIC TAC TOE", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      body: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xffebebeb),
        body: this.body,
      ),
    );
  }
}