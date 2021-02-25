import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

class WishedSightCard extends SightCard {
  WishedSightCard(Sight sight) : super(sight);

  @override
  Widget _buildSpecificInfo() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 2),
      child: Text(
        'Запланировано на 12 окт. 2020',
        style: textRegular14.copyWith(color: Colors.green),
      ),
    );
  }

  @override
  Widget _buildButtons() {
    return Container(
      height: 25,
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset('res/icons/calendar-white.svg'),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset('res/icons/close-white.svg'),
            ),
          ),
        ],
      ),
    );
  }
}

class VisitedSightCard extends SightCard {
  VisitedSightCard(Sight sight) : super(sight);

  @override
  Widget _buildSpecificInfo() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 2),
      child: Text(
        'Цель достигнута 12 окт. 2020',
        style: textRegular14Secondary,
      ),
    );
  }

  @override
  Widget _buildButtons() {
    return Container(
      height: 25,
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset('res/icons/share-white.svg'),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset('res/icons/close-white.svg'),
            ),
          ),
        ],
      ),
    );
  }
}

/// Виджет карточки места для страницы списка мест
class SightCard extends StatelessWidget {
  final Sight _sight;
  final Color _imageBackgroundColor;
  final Color _backgroundColor;

  SightCard(
    this._sight, {
    Color imageBackgroundColor = imageBackgroundColor,
    Color backgroundColor = backgroundColor,
  })  : _imageBackgroundColor = imageBackgroundColor,
        _backgroundColor = backgroundColor;

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

  Widget _buildTopPart() {
    return SizedBox(
      height: 96,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildImage(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: _buildType(),
                ),
                Expanded(
                  flex: 1,
                  child: _buildButtons(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        child: Image.network(
          _sight.imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) => progress != null
              ? Container(
                  height: double.infinity,
                  color: _imageBackgroundColor,
                  child: Center(child: CircularProgressIndicator()),
                )
              : child,
        ),
      ),
    );
  }

  Widget _buildType() {
    return Container(
      height: 25,
      alignment: Alignment.centerLeft,
      child: Text(
        _sight.type,
        style: textBold14.copyWith(
          color: Colors.white,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      height: 25,
      alignment: Alignment.centerRight,
      child: SvgPicture.asset('res/icons/heart-white.svg'),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
        color: _backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTitle(),
            _buildSpecificInfo(),
            _buildSchedule(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        _sight.name,
        textAlign: TextAlign.left,
        style: textRegular.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildSchedule() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 2),
      child: Text(
        'Закрыто до 20:00',
        style: textRegular14Secondary,
      ),
    );
  }

  Widget _buildSpecificInfo() {
    return Container();
  }
}
