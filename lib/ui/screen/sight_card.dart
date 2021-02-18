import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_styles.dart';

/// Виджет карточки места для страницы списка мест
class SightCard extends StatelessWidget {
  final Sight _sight;

  SightCard(this._sight);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          _buildTopPart(),
          _buildBottomPart(),
        ],
      ),
    );
  }

  _buildTopPart() {
    var typeText = Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Text(
        _sight.type,
        style: textBold14.copyWith(
          color: Colors.white,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return Container(
      height: 96,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(_sight.imageUrl),
          )),
      child: Stack(
        children: [
          typeText,
          ButtonToWishList(),
        ],
      ),
    );
  }

  _buildBottomPart() {
    var title = Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Text(
        _sight.name,
        style: textRegular.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );

    var details = Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 2),
      child: Text(
        _sight.details,
        style: textRegular14Secondary,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return Container(
      height: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
        color: Color(0xffF5F5F5),
      ),
      child: Column(
        children: [
          title,
          details,
        ],
      ),
    );
  }
}

/// Виджет кнопки добавить в список желаний
class ButtonToWishList extends StatelessWidget {
  final double _width;
  final double _height;
  final double _top;
  final double _right;

  ButtonToWishList(
      {double width = 20,
      double height = 20,
      double top = 19,
      double right = 18})
      : _top = top,
        _right = right,
        _width = width,
        _height = height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _top,
      right: _right,
      child: Container(
        width: _width,
        height: _height,
        child: Icon(Icons.favorite_border, color: Colors.white),
      ),
    );
  }
}
