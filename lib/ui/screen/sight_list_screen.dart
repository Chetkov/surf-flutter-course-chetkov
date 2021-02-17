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
      appBar: _SightListAppBar(),
      body: _SightListBody(_sights),
    );
  }
}

/// Виджет App бара для экрана со списком мест
class _SightListAppBar extends StatelessWidget with PreferredSizeWidget {
  final double _height;

  _SightListAppBar([this._height = 152]);

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

/// Виджет списка для экрана со списком мест
class _SightListBody extends StatelessWidget {
  final List<Sight> _sights;

  const _SightListBody(this._sights, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: _sights.map((sight) => SightCard(sight)).toList(),
        ),
      ),
    );
  }
}




