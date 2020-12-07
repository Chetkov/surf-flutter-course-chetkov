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
        title: Text(
          'Список\nинтересных мест',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          textAlign: TextAlign.left,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
      )
    );
  }
}
