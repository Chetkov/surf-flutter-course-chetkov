import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton was pressed!');
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
        ),
      ]),
      appBar: AppBar(
        title: Text('Sight list'),
        actions: [
          IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                print('Help was pressed');
              }),
          IconButton(
              icon: Icon(Icons.question_answer),
              onPressed: () {
                print('FAQ was pressed');
              })
        ],
      ),
      drawer: Drawer(),
    );
  }
}
