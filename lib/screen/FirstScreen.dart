import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/model/PlayerModel.dart';
import 'package:toast/toast.dart';

class FirstScreen extends StatefulWidget {
  @override
  createState() => FirstScreenState();
}

class FirstScreenState extends State {
  var playerOneName = TextEditingController();
  var playerTwoName = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void insertData() {
    if (_formKey.currentState.validate()) {
      var player = PlayerModel(playerOneName.text, playerTwoName.text);
      Navigator.pushNamed(context, "/player", arguments: player);
    }
  }

  String validate(value) {
    if (isTextEmpty(value)) {
      Toast.show("Name of player cannot be empty", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return "";
    } else {
      return null;
    }
  }

  bool isTextEmpty(value) {
    if (value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Form(
                key: _formKey,
                child: Card(
                  elevation: 2,
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20),
                      ),
                      Text(
                        "New Game!",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Enter Player One Name",
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                              ),
                              validator: validate,
                              controller: playerOneName,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Enter Player Two Name",
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                              ),
                              validator: validate,
                              controller: playerTwoName,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                side: BorderSide(color: Colors.white)),
                            padding: EdgeInsets.all(20.0),
                            onPressed: insertData,
                            color: Colors.white,
                            child: Text(
                              "Start New Game",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
