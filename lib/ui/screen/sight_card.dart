import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight _sight;

  SightCard(this._sight);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 328, minHeight: 188),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          _makeTopPart(),
          _makeBottomPart(),
        ],
      ),
    );
  }

  _makeTopPart() {
    var typeText = Container(
      constraints: BoxConstraints(minWidth: 328),
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Text(
        _sight.type,
        style: defaultTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );

    var toWishListButton = Positioned(
      top: 19,
      right: 18,
      child: Container(
        width: 20,
        height: 20,
        child: Icon(Icons.favorite_border, color: Colors.white),
      ),
    );

    return Container(
      constraints: BoxConstraints(minWidth: 328),
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
          toWishListButton,
        ],
      ),
    );
  }

  _makeBottomPart() {
    var nameText = Container(
      constraints: BoxConstraints(minWidth: 328),
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Text(
        _sight.name,
        style: defaultTextStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xff3B3E5B),
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );

    var detailsText = Container(
      constraints: BoxConstraints(minWidth: 328),
      margin: EdgeInsets.only(left: 16, right: 16, top: 2),
      child: Text(
        _sight.details,
        style: defaultTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xff7C7E92),
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return Container(
      constraints: BoxConstraints(minWidth: 328),
      height: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
        color: Color(0xffF5F5F5),
      ),
      child: Column(
        children: [
          nameText,
          detailsText,
        ],
      ),
    );
  }
}

const defaultTextStyle = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: 'Roboto',
);
