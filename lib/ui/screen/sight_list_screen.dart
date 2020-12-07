import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Color(0xff3B3E5B),
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
            children: [
              TextSpan(children: [
                TextSpan(text: 'С', style: TextStyle(color: Colors.green)),
                TextSpan(text: 'писок\n'),
              ]),
              TextSpan(children: [
                TextSpan(text: 'и', style: TextStyle(color: Colors.yellow)),
                TextSpan(text: 'нтересных мест'),
              ])
            ]
          )
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 128,
      )
    );
  }
}
