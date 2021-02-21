import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

/// Виджет карточки места для страницы списка мест
class SightCard extends StatelessWidget {
  final Sight _sight;
  final Color _topBackgroundColor;
  final Color _bottomBackgroundColor;

  SightCard(
    this._sight, {
    Color topBackgroundColor = imageBackgroundColor,
    Color bottomBackgroundColor = backgroundColor,
  })  : _topBackgroundColor = topBackgroundColor,
        _bottomBackgroundColor = bottomBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          _buildTopPart(),
          _buildBottomPart(),
        ],
      ),
    );
  }

  _buildTopPart() {
    var typeText = Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Text(
        _sight.type,
        style: textBold14.copyWith(
          color: Colors.white,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return SizedBox(
      height: 96,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                _sight.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) => progress != null
                    ? Container(
                        height: double.infinity,
                        color: _topBackgroundColor,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : child,
              ),
            ),
          ),
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
        color: _bottomBackgroundColor,
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
  final double _top;
  final double _right;

  ButtonToWishList({
    double top = 16,
    double right = 16,
  })  : _top = top,
        _right = right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _top,
      right: _right,
      child: Container(
        child: SvgPicture.asset('res/icons/heart-white.svg'),
      ),
    );
  }
}
