
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:firebase_database/firebase_database.dart';


class MessageContainer extends StatefulWidget {
  static String userName;

  const MessageContainer({Key key, userName}): super(key: key);

  @override
  MessageContainerState createState() => new MessageContainerState();
}

class MessageContainerState extends State<MessageContainer> {
  String results = "";

  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Using EditText"),
        backgroundColor: Colors.red,
      ),
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(hintText: "Enter text here..."),
                onSubmitted: (String str) {
                  setState(() {
                    results = results + "\n" + str;
                    controller.text = "";
                  });
                },
                controller: controller,
              ),
              new RaisedButton(
                child: new Text("Send"),
                onPressed: (){
                  if(controller.text.length > 0) {
                    DbOperations.createRecord(controller.text, MessageContainer.userName);
                    controller.text = "";
                  }
                },
              ),
              new Text(results)
            ],
          ),
        ),
      ),
    );
  }
}

class DbOperations {

  static var databaseReference = FirebaseDatabase.instance.reference();

  static void createRecord(String message, String user){
    databaseReference.child("message").push().set({
      'language': ui.window.locale.languageCode,
      'message': message,
      'timestamp' :  DateTime.now().toString(),
      'user': user
    });
  }

  static Stream<DataSnapshot>  getData(){
    return databaseReference.once().asStream();
  }

}