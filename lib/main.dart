import 'package:flutter/material.dart';
import 'package:tictactoe/ScaffoldCustom.dart';
import 'package:tictactoe/screen/FirstScreen.dart';
import 'package:tictactoe/screen/PlayerScreen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  onGenerateRoute: buildRoute,
  home: ScaffoldCustom(
    body: FirstScreen(),
  ),
));

Route buildRoute(RouteSettings settings) {
  var routes = <String, WidgetBuilder>{
    "/": (context) => ScaffoldCustom(
      body: FirstScreen(),
    ),
    "/player": (context) => ScaffoldCustom(
      body: PlayerScreen(
        player: settings.arguments,
      ),
    ),
  };

  WidgetBuilder widgetBuilder = routes[settings.name];
  return MaterialPageRoute(builder: (context) => widgetBuilder(context));

}
