
import 'package:flutter/material.dart';

class MessageContainer extends StatefulWidget {
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
//                  setState((){
//                   //sample
//                    hintText.text = ""
//                  });
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