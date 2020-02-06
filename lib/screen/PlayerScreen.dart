import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/model/PlayerModel.dart';

class PlayerScreen extends StatefulWidget {
  PlayerModel player;

  PlayerScreen({this.player});

  State<StatefulWidget> createState() {
    return PlayerScreenState(player);
  }
}

class PlayerScreenState extends State {
  PlayerModel players;
  var playerActive = "";

  PlayerScreenState(player) {
    this.players = player;
    playerActive = players.playerOneName;
    ticTacToe();
  }

  List<List> point;
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  String object = "⚫";

  ticTacToe() {
    point = List<List>(3);
    for (var i = 0; i < 3; i++) {
      point[i] = List(3);
      for (var j = 0; j < 3; j++) {
        point[i][j] = " ";
      }
    }
    object = "⚫";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildPoint(0, 0),
                buildPoint(0, 1),
                buildPoint(0, 2)
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildPoint(1, 0),
                buildPoint(1, 1),
                buildPoint(1, 2)
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildPoint(2, 0),
                buildPoint(2, 1),
                buildPoint(2, 2)
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Text("Session: " + playerActive, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            RaisedButton(
              child: Icon(Icons.refresh),
              onPressed: (){
                setState(() {
                  ticTacToe();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  buildPoint(int i, int j) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (point[i][j] == " ") {
            if (object == "✗") {
              point[i][j] = "⚫";
              playerActive = players.playerOneName;
            } else {
              point[i][j] = "✗";
              playerActive = players.playerTwoName;
            }
            object = point[i][j];
            checkWin();
          }
        });
      },
      child: Container(
          width: 90.0,
          height: 90.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Color(0xffffffff)),
          ),
          child: Center(
            child: Text(
              point[i][j],
              style: TextStyle(fontSize: 70.0),
            ),
          )),
    );
  }

  checkWin() {
    var xo = " ";
    bool b = false;
    if (point[0][0] == point[0][1] &&
        point[0][1] == point[0][2] &&
        point[0][0] != " " &&
        point[0][1] != " " &&
        point[0][2] != " ") {
      xo = point[0][0];
      b = true;
    } else if (point[1][0] == point[1][1] &&
        point[1][1] == point[1][2] &&
        point[1][0] != " " &&
        point[1][1] != " " &&
        point[1][2] != " ") {
      xo = point[1][0];
      b = true;
    } else if (point[2][0] == point[2][1] &&
        point[2][1] == point[2][2] &&
        point[2][0] != " " &&
        point[2][1] != " " &&
        point[2][2] != " ") {
      xo = point[2][0];
      b = true;
    } else if (point[0][0] == point[1][0] &&
        point[1][0] == point[2][0] &&
        point[0][0] != " " &&
        point[1][0] != " " &&
        point[2][0] != " ") {
      xo = point[0][0];
      b = true;
    } else if (point[0][1] == point[1][1] &&
        point[1][1] == point[2][1] &&
        point[0][1] != " " &&
        point[1][1] != " " &&
        point[2][1] != " ") {
      xo = point[0][1];
      b = true;
    } else if (point[0][2] == point[1][2] &&
        point[1][2] == point[2][2] &&
        point[0][2] != " " &&
        point[1][2] != " " &&
        point[2][2] != " ") {
      xo = point[0][2];
      b = true;
    } else if (point[0][0] == point[1][1] &&
        point[1][1] == point[2][2] &&
        point[0][0] != " " &&
        point[1][1] != " " &&
        point[2][2] != " ") {
      xo = point[0][0];
      b = true;
    } else if (point[0][2] == point[1][1] &&
        point[1][1] == point[2][0] &&
        point[0][2] != " " &&
        point[1][1] != " " &&
        point[2][0] != " ") {
      xo = point[0][2];
      b = true;
    }
    if (b == true) {
      var playerWinner;
      if (xo=="✗"){
        playerWinner = players.playerOneName;
      } else {
        playerWinner = players.playerTwoName;
      }
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              content: Text("Congratulations " + playerWinner + "! (" + xo + ") is the winners!"),
              title: Text("You Are Winner"),
            );
          }
      );
    }
  }
}
