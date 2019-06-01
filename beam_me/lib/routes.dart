import 'package:flutter/material.dart';
import 'package:beam_me/screens/root/rootpage.dart';
import 'package:beam_me/services/authentication.dart';

class Routes {

  static Auth auth;
  final routes = <String, WidgetBuilder> {
    '/Auth': (BuildContext context) => new RootPage(auth: new Auth())
  };

  Routes () {
    auth = new Auth();
    runApp(new MaterialApp(
      title: 'Beam Me',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new RootPage(auth: new Auth()),
      ),
    );
  }
}