import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

class WishedSightCard extends SightCard {
  WishedSightCard(Sight sight) : super(sight);

  @override
  _WishedSightCardState createState() => _WishedSightCardState();
}

class _WishedSightCardState extends _SightCardState {
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
  _VisitedSightCardState createState() => _VisitedSightCardState();
}

class _VisitedSightCardState extends _SightCardState {
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
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: SvgPicture.asset(
                  'res/icons/share-white.svg',
                ),
                onPressed: () {
                  print("Share-button pressed on place: " + widget._sight.name);
                },
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: SvgPicture.asset('res/icons/close-white.svg'),
                onPressed: () {
                  print("Close-button pressed on place: " + widget._sight.name);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Виджет карточки места для страницы списка мест
class SightCard extends StatefulWidget {
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
  _SightCardState createState() => _SightCardState();
}

class _SightCardState extends State<SightCard> {
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
          widget._sight.imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) => progress != null
              ? Container(
                  height: double.infinity,
                  color: widget._imageBackgroundColor,
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
        widget._sight.type,
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
      child: IconButton(
        // splashColor: widget._sight.isWished ? Colors.white : Colors.red,
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(
          'res/icons/heart-white.svg',
          color: widget._sight.isWished ? wishBtnColorActive : Colors.white,
        ),
        onPressed: () {
          widget._sight.isWished = !widget._sight.isWished;
          print("Wish-button pressed on place: " + widget._sight.name);
          setState(() {});
        },
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
        color: widget._backgroundColor,
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
        widget._sight.name,
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
