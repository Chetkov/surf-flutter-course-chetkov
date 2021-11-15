import 'package:flutter/material.dart';
import 'package:places/domain/filter_model.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/widget/custom_range_slider.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<FilterModel>(
          builder: (context, model, child) => CustomRangeSlider(
            'Расстояние',
            RangeValues(100, 10000),
            99,
            RangeValues(100, 10000),
            model
          ),
        ),
      ),
    );
  }
}
