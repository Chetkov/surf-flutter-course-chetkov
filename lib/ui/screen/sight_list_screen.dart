import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_card.dart';

var defaultTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
);

class SightListScreen extends StatefulWidget {
  final List<Sight> _sights;

  const SightListScreen(this._sights, {Key key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState(_sights);
}

class _SightListScreenState extends State<SightListScreen> {
  final List<Sight> _sights;

  _SightListScreenState(this._sights);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SightListAppBar(),
      body: SightListBody(_sights),
    );
  }
}

class SightListAppBar extends StatelessWidget with PreferredSizeWidget {
  final double _height;

  SightListAppBar([this._height = 152]);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        height: _height,
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(bottom: 16),
        child: Text(
          'Список\nинтересных мест',
          style: defaultTextStyle.copyWith(
            color: Color(0xff3B3E5B),
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
      toolbarHeight: _height,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_height);
}

class SightListBody extends StatelessWidget {
  final List<Sight> _sights;

  const SightListBody(this._sights, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: _makeSightCards(),
        ),
      ),
    );
  }

  List<Widget> _makeSightCards() {
    List<SightCard> sightCards = [];
    for (var sight in _sights) {
      sightCards.add(SightCard(sight));
    }
    return sightCards;
  }
}




