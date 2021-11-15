import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';

class CustomRangeSlider extends StatefulWidget {
  final String _title;
  final RangeValues _radiusRangeBoundaries;
  final RangeValues _radiusRange;
  final int _divisions;
  final CustomRange _changeNotifier;

  CustomRangeSlider(this._title, this._radiusRangeBoundaries, this._divisions, this._radiusRange, this._changeNotifier);

  @override
  _CustomRangeSliderState createState() => _CustomRangeSliderState(this._radiusRange);
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  RangeValues _radiusRange;

  _CustomRangeSliderState(this._radiusRange);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          title: Text(widget._title, style: textRegular16),
          trailing: Text("от ${_radiusRange.start.toInt()} до ${_radiusRange.end.toInt()} м", style: textRegular16Secondary,),
        ),
        RangeSlider(
          values: _radiusRange,
          min: widget._radiusRangeBoundaries.start,
          max: widget._radiusRangeBoundaries.end,
          onChanged: (RangeValues newRadiusRange) {
            setState(() {
              _radiusRange = newRadiusRange;
              widget._changeNotifier.changeRange(_radiusRange);
            });
          },
          divisions: widget._divisions,
        ),
      ],
    );
  }
}

abstract class CustomRange {
  void changeRange(RangeValues newRange);
  RangeValues getRangeValues();
}