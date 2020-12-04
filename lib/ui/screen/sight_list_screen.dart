import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen_const.dart';

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
            label: BOTTOM_NAVIGATION_BAR_ITEM_HOME
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: BOTTOM_NAVIGATION_BAR_ITEM_MESSAGES,
        ),
      ]),
      appBar: AppBar(
        title: Text(APP_BAR_TITLE),
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
