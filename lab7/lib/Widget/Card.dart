import 'package:flutter/material.dart';

class card extends StatefulWidget {
  String content;
  card({this.content = " - " });
  @override
  _cardState createState() => _cardState();
}

class _cardState extends State<card> {
  get child => null;

  @override
  Widget build(BuildContext context) {
     return Card(
      child: Container(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(widget.content)),
        ),
      ),
    );
  }
}
