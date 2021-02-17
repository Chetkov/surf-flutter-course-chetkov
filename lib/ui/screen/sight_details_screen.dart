import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

var defaultTextStyle = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: 'Roboto',
  color: Color(0xff3B3E5B),
);

/// Экран карточки места
class SightDetailsScreen extends StatefulWidget {
  final Sight _sight;

  SightDetailsScreen(this._sight);

  @override
  _SightDetailsState createState() => _SightDetailsState(_sight);
}

class _SightDetailsState extends State<SightDetailsScreen> {
  final Sight _sight;

  _SightDetailsState(this._sight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SightDetailsGallery(_sight),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _sight.name,
                    textAlign: TextAlign.left,
                    style: defaultTextStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Wrap(
                      spacing: 16,
                      children: [
                        Text(
                          _sight.type,
                          style: defaultTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Закрыто до 09:00',
                          style: TextStyle(
                            color: Color(0xff7C7E92),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(
                      _sight.details,
                      style: defaultTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff4CAF50),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      children: [
                        Icon(
                          Icons.map,
                          color: Colors.white,
                        ),
                        Text(
                          'ПОСТРОИТЬ МАРШРУТ',
                          style: defaultTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    height: 48,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    height: 0.6,
                    color: Colors.black.withAlpha(56),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 14,
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.black.withAlpha(56),
                                ),
                                Text(
                                  'Запланировать',
                                  style: defaultTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withAlpha(56),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 14,
                              children: [
                                Icon(
                                  Icons.favorite_border,
                                  color: Color(0xff3B3E5B),
                                ),
                                Text(
                                  'В избранное',
                                  style: defaultTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff3B3E5B),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SightDetailsGallery extends StatelessWidget {
  final Sight _sight;

  SightDetailsGallery(this._sight);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(height: 360, image: NetworkImage(_sight.imageUrl), fit: BoxFit.cover),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {},
            ),
          ),
          top: 36,
          left: 16,
        )
      ],
    );
  }
}
