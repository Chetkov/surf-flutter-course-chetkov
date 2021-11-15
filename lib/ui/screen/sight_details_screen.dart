import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widget/hr.dart';

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
                    style: textBold24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Wrap(
                      spacing: 16,
                      children: [
                        Text(
                          _sight.type,
                          style: textBold14,
                        ),
                        Text(
                          'Закрыто до 09:00',
                          style: textRegular14Secondary,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(
                      _sight.details,
                      style: textBold.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Stack(
                      children: [
                        Container(
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: btnColorPrimary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('res/icons/go-white.svg'),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'ПОСТРОИТЬ МАРШРУТ',
                                  style: textBold14.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                print(
                                    "Navigate to place: " + widget._sight.name);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 24),
                      child: HorizontalLine()),
                  SizedBox(
                    height: 48,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                print("Schedule-button tapped on place: " +
                                    widget._sight.name);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'res/icons/calendar-dark-transparent.svg'),
                                    Padding(
                                      padding: EdgeInsets.only(left: 14),
                                      child: Text(
                                        'Запланировать',
                                        style: textRegular14.copyWith(
                                          color: Colors.black.withAlpha(56),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                print("ToWishList-button tapped on place: " +
                                    widget._sight.name);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'res/icons/heart-dark.svg'),
                                    Padding(
                                      padding: EdgeInsets.only(left: 14),
                                      child: Text(
                                        'В избранное',
                                        style: textRegular14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
        SizedBox(
          height: 360,
          child: Image.network(
            _sight.imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              return progress != null
                  ? Center(child: CircularProgressIndicator())
                  : child;
            },
          ),
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 32,
                  height: 32,
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 16,
                  ),
                ),
                onTap: () {
                  print("Pressed back-button on place: " + _sight.name);
                },
              ),
            ),
          ),
          top: 36,
          left: 16,
        ),
      ],
    );
  }
}
