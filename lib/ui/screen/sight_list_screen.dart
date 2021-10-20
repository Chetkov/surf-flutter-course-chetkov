import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/sight_card.dart';

/// Экран списка мест
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
      bottomNavigationBar: BottomNavigationMenu(),
    );
  }
}

/// Экран списков желаемых/посещенных мест
class WishedOrVisitedSightListScreen extends StatefulWidget {
  final List<Sight> _sights;

  const WishedOrVisitedSightListScreen(this._sights, {Key key}) : super(key: key);

  @override
  _WishedOrVisitedSightListScreenState createState() => _WishedOrVisitedSightListScreenState(_sights);
}

class _WishedOrVisitedSightListScreenState extends State<WishedOrVisitedSightListScreen> {
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
        bottomNavigationBar: BottomNavigationMenu(),
      ),
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
          style: textBold32,
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
  final String _title;
  final String _description;

  EmptyListStub(this._title, this._description, this._svgPath);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(_svgPath),
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

/// Нижнее навигационное меню
class BottomNavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('res/icons/bnb-list.svg'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('res/icons/bnb-map.svg'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('res/icons/bnb-heart.svg'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('res/icons/bnb-settings.svg'),
          label: '',
        ),
      ],
    );
  }
}




