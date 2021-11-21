import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/search_history_model.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_search_screen.dart';

import '../../mocks.dart';
import 'filter_screen.dart';

/// Экран списка мест
class SightListScreen extends StatefulWidget {
  final List<Sight> _sights;

  const SightListScreen(this._sights, {Key? key}) : super(key: key);

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
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 177,
          height: 48,
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xffFCDD3D), Color(0xff4CAF50)]),
            borderRadius: BorderRadius.circular(24),
          ),
          child: MaterialButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("+ ", style: textRegular24.copyWith(color: Colors.white)),
                Text("НОВОЕ МЕСТО",
                    style: textBold14.copyWith(color: Colors.white)),
              ],
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            color: Colors.transparent,
            elevation: 0.0,
            highlightElevation: 0.0,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SightAddingScreen()),
              );
            },
          ),
        ),
      ),
      body: _SightListBody(_sights),
    );
  }
}

/// Экран списков желаемых/посещенных мест
class WishedOrVisitedSightListScreen extends StatefulWidget {
  final List<Sight> _sights;

  const WishedOrVisitedSightListScreen(this._sights, {Key? key})
      : super(key: key);

  @override
  _WishedOrVisitedSightListScreenState createState() =>
      _WishedOrVisitedSightListScreenState(_sights);
}

class _WishedOrVisitedSightListScreenState
    extends State<WishedOrVisitedSightListScreen> {
  final List<Sight> _sights;

  _WishedOrVisitedSightListScreenState(this._sights);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              'Избранное',
              style: TextStyle(color: textColorPrimary),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container(
              width: 326,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffF5F5F5),
              ),
              child: TabBar(
                  indicator: BoxDecoration(
                    color: textColorPrimary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  unselectedLabelColor: textColorThird,
                  tabs: [
                    Tab(text: 'Хочу посетить'),
                    Tab(text: 'Посетил'),
                  ]),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _WishedSightListBody(_sights.sublist(0, 0)),
            _VisitedSightListBody(_sights.sublist(1, 4)),
            // Center(child: Text('Tab content 1')),
            // Center(child: Text('Tab content 2')),
          ],
        ),
      ),
    );
  }
}

/// Виджет App бара для экрана со списком мест
class _SightListAppBar extends StatelessWidget with PreferredSizeWidget {
  _SightListAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 120,
      title: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "Список интересных мест",
              overflow: TextOverflow.clip,
              softWrap: true,
              style: text24w500,
            ),
            Container(
              padding: EdgeInsets.only(top: 22),
              height: 62,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        SightSearchScreen(),
                    transitionDuration: Duration.zero,
                  ));
                },
                child: TextField(
                  decoration: InputDecoration(
                      enabled: false,
                      prefixIcon: Container(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset('res/icons/search.svg'),
                      ),
                      label: Text("Поиск", style: textRegular16Third),
                      suffixIcon: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FilterScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: SvgPicture.asset('res/icons/filters.svg'),
                        ),
                      ),
                      fillColor: Color(0xfff0f0f0),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12))
                      // enabled: false,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}

/// Виджет списка для экрана со списком мест
class _SightListBody extends _AbstractSightListBody {
  _SightListBody(List<Sight> sights) : super(sights);

  @override
  SightCard _buildSightCard(Sight sight) {
    return SightCard(sight);
  }

  @override
  EmptyListStub _buildEmptyListStub() {
    return EmptyListStub(
      'Пусто',
      'Пока что здесь ничего нет',
      'res/icons/wish-list-empty-image.svg',
    );
  }
}

/// Виджет списка для таба "Хочу посетить"
class _WishedSightListBody extends _AbstractSightListBody {
  const _WishedSightListBody(List<Sight> sights) : super(sights);

  @override
  SightCard _buildSightCard(Sight sight) {
    return WishedSightCard(sight);
  }

  @override
  EmptyListStub _buildEmptyListStub() {
    return EmptyListStub(
      'Пусто',
      'Отмечайте понравившиеся\n места и они появятся здесь.',
      'res/icons/wish-list-empty-image.svg',
    );
  }
}

/// Виджет списка для таба "Посетил"
class _VisitedSightListBody extends _AbstractSightListBody {
  _VisitedSightListBody(List<Sight> sights) : super(sights);

  @override
  SightCard _buildSightCard(Sight sight) {
    return VisitedSightCard(sight);
  }

  @override
  EmptyListStub _buildEmptyListStub() {
    return EmptyListStub(
      'Пусто',
      'Завершите маршрут,\n чтобы место попало сюда.',
      'res/icons/visited-list-empty-image.svg',
    );
  }
}

/// Абстрактный родитель списков мест, реализует общую логику построения
abstract class _AbstractSightListBody extends StatelessWidget {
  final List<Sight> _sights;

  const _AbstractSightListBody(this._sights);

  @override
  Widget build(BuildContext context) {
    return _sights.isEmpty == true
        ? _buildEmptyListStub()
        : Padding(
            padding: EdgeInsets.only(top: 22),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children:
                      _sights.map((sight) => _buildSightCard(sight)).toList(),
                ),
              ),
            ),
          );
  }

  SightCard _buildSightCard(Sight sight);

  EmptyListStub _buildEmptyListStub();
}

/// Заглушка для пустых списков
class EmptyListStub extends StatelessWidget {
  final String _svgPath;
  final double? _width;
  final double? _height;
  final String _title;
  final String _description;

  EmptyListStub(this._title, this._description, this._svgPath, {width, height})
      : this._width = width,
        this._height = height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              _svgPath,
              width: _width,
              height: _height,
            ),
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                _title,
                style: textRegular18Third.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(_description,
                  textAlign: TextAlign.center, style: textRegular14Third),
            ),
          ],
        ),
      ),
    );
  }
}
