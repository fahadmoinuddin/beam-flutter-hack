import 'package:flutter/material.dart';
import 'Message.dart';
import 'package:firebase_mlkit_language/firebase_mlkit_language.dart';

class ListTranslate extends StatefulWidget {
  ListTranslate({Key key}) : super(key: key);
  final LanguageIdentifier languageIdentifier = FirebaseLanguage.instance.languageIdentifier();

//  void _processText() {
//    final ModelManager modelManager = FirebaseLanguage.instance.modelManager();
//    FirebaseLanguage.instance.modelManager().downloadModel("en");
//    final List<LanguageLabel> labels = await languageIdentifier.processText("Sample");
//  };

  @override
  _ListTranslateState createState() => _ListTranslateState();


}

class _ListTranslateState extends State<ListTranslate> {
  List<Message> _items = [
    Message(
      "I'm trying to leave the text in the top of the container, but even with FractionalOffset(1.0, 0.0) the text continues in the middle of the container.",
      "jaunâtre",
    ),
    Message(
      "I'm trying to leave the text in the top of the container, but even with FractionalOffset(1.0, 0.0) the text continues in the middle of the container.",
      "cracher",
    ),
    Message(
      "pour combler",
      "to fill",
    ),
    Message(
      "frisson",
      "thrill",
    ),
    Message(
      "chime",
      "carillon",
    ),
    Message(
      "gaz de chiste",
      "shale gas",
    ),
    Message(
      "a bold statement",
      "une déclaration audacieuse",
    ),
    Message(
      "slick",
      "nappe",
    ),
    Message(
      "sketch",
      "dessin",
    ),
    Message(
      "sketch",
      "dessin",
    ),
    Message(
      "serve",
      "desservir",
    ),
  ];

  Widget _displayCard(int index) {
    bool _isOdd = (index % 2 == 1);
    return
      Container(
        height: 100,
        color: _isOdd ? Colors.black12 : Colors.white12,
        alignment: _isOdd ? Alignment.centerRight : Alignment.centerLeft,

        child: Padding(padding: EdgeInsets.only(left:_isOdd ? 100 : 16, top: 16, right: _isOdd ? 16: 100, bottom: 16),
          child: Text(
            _items[index].text,
            style: TextStyle(
              color: _isOdd ? Colors.blue : Colors.amber,
              fontWeight: FontWeight.w900,

            ),
            softWrap: true,
            maxLines: 1000,
            overflow: TextOverflow.ellipsis,
          ),
        )

      );

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return _displayCard(index);
      },
    );
  }
}