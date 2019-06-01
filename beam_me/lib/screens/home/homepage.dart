import 'package:flutter/material.dart';
import 'package:beam_me/services/authentication.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key, this.auth, this.userId, this.onSignedOut}) : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Chat'),
      ),
      body: new ListView(
        children: <Widget>[
          _showMessageList(),
          _showMessageForm()
        ],
      ),
    );
  }

  Widget _showMessageList() {

  }

  Widget _showMessageForm() {

  }
}