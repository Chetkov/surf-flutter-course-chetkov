import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      // home: SightListScreen(sightMocks),
      // home: SightDetailsScreen(sightMocks[3]),
      home: WishedOrVisitedSightListScreen(sightMocks),
      title: 'Some title',
    );
  }
}
