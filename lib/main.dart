import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/filter_model.dart';
import 'package:places/domain/search_history_model.dart';
import 'package:places/domain/settings_model.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<SettingsModel>(create: (context) => SettingsModel(false)),
        ListenableProvider<FilterModel>(create: (context) => FilterModel(RangeValues(100, 10000))),
        ListenableProvider<SearchHistoryModel>(create: (context) => SearchHistoryModel(searchHistory)),
      ],
      child: Consumer<SettingsModel>(
        builder: (context, value, child) => MaterialApp(
          theme: value.isDarkThemeEnabled ? darkTheme : lightTheme,
          home: Scaffold(
            body: [
              SightListScreen(sightMocks),
              Container(),
              WishedOrVisitedSightListScreen(sightMocks),
              SettingsScreen(),
            ][_currentIndex],
            // body: SightAddingScreen(),
            bottomNavigationBar:  BottomNavigationBar(
              showUnselectedLabels: false,
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (int tabIndex) {
                setState(() {
                  _currentIndex = tabIndex;
                });
                print("Tapped on tab: " + tabIndex.toString());
              },
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('res/icons/bnb-list.svg'),
                    label: '',
                    tooltip: 'Список'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('res/icons/bnb-map.svg'),
                    label: '',
                    tooltip: 'Карта'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('res/icons/bnb-heart.svg'),
                    label: '',
                    tooltip: 'Список желаний'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('res/icons/bnb-settings.svg'),
                    label: '',
                    tooltip: 'Настройки'),
              ],
            ),
          )
        ),
      ),
    );
  }
}
