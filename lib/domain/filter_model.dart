import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/widget/custom_range_slider.dart';

class FilterModel extends ChangeNotifier implements CustomRange {
  RangeValues _radius;

  FilterModel(this._radius);

  @override
  void changeRange(RangeValues newRange) {
    _radius = newRange;
    notifyListeners();
  }

  @override
  RangeValues getRangeValues() {
    return _radius;
  }
}