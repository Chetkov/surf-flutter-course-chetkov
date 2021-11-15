import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/settings_model.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/widget/hr.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Настройки",
          style: TextStyle(color: textColorPrimary),
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<SettingsModel>(
        builder: (context, value, child) => ListView(
          children: [
            SwitchListTile(
              title: Text("Тёмная тема", style: textRegular16),
              value: value.isDarkThemeEnabled,
              activeTrackColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (bool currentValue) {
                setState(() {
                  value.isDarkThemeEnabled = currentValue;
                });
              },
            ),
            HorizontalLine(),
            ListTile(
              title: Text("Смотреть туториал", style: textRegular16,),
              trailing: SvgPicture.asset('res/icons/tutorial-info.svg'),
              onTap: () {},
            ),
            HorizontalLine(),
          ],
        ),
      ),
    );
  }
}
