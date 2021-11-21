import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/text_styles.dart';

class SightAddingScreen extends StatefulWidget {
  const SightAddingScreen({Key? key}) : super(key: key);

  @override
  State<SightAddingScreen> createState() => _SightAddingScreenState();
}

class _SightAddingScreenState extends State<SightAddingScreen> {
  TextEditingController _nameFieldController = TextEditingController();
  TextEditingController _latitudeFieldController = TextEditingController();
  TextEditingController _longitudeFieldController = TextEditingController();
  TextEditingController _descriptionFieldController = TextEditingController();

  FocusNode _nameFieldFocusNode = FocusNode();
  FocusNode _latitudeFieldFocusNode = FocusNode();
  FocusNode _longitudeFieldFocusNode = FocusNode();
  FocusNode _descriptionFieldFocusNode = FocusNode();
  FocusNode _saveButtonFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Новое место",
          style: text24w500,
        ),
        leadingWidth: 130,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: MaterialButton(
            highlightColor: Colors.transparent,
            // splashColor: Colors.transparent,
            highlightElevation: 0,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Отмена", style: text16w500Secondary),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text("НАЗВАНИЕ", style: textRegular14Third),
                      ),
                      TextField(
                        focusNode: _nameFieldFocusNode,
                        controller: _nameFieldController,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "Название",
                        ),
                        onEditingComplete: () =>
                            _latitudeFieldFocusNode.requestFocus(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child:
                                      Text("ШИРОТА", style: textRegular14Third),
                                ),
                                TextField(
                                  focusNode: _latitudeFieldFocusNode,
                                  controller: _latitudeFieldController,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: "Широта",
                                  ),
                                  keyboardType: TextInputType.number,
                                  onEditingComplete: () =>
                                      _longitudeFieldFocusNode.requestFocus(),
                                )
                              ],
                            ),
                          ),
                          Expanded(child: Container(), flex: 1),
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text("ДОЛГОТА",
                                      style: textRegular14Third),
                                ),
                                TextField(
                                  focusNode: _longitudeFieldFocusNode,
                                  controller: _longitudeFieldController,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: "Долгота",
                                  ),
                                  keyboardType: TextInputType.number,
                                  onEditingComplete: () =>
                                      _descriptionFieldFocusNode.requestFocus(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Row(
                          children: [
                            Text(
                              "Указать на карте",
                              style: text16w500.copyWith(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text("ОПИСАНИЕ", style: textRegular14Third),
                      ),
                      TextField(
                        focusNode: _descriptionFieldFocusNode,
                        controller: _descriptionFieldController,
                        autofocus: false,
                        minLines: 3,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          hintText: "Введите текст",
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Container(
                      width: double.infinity,
                      height: 48,
                      child: MaterialButton(
                        color: Colors.green,
                        elevation: 0.0,
                        highlightElevation: 0.0,
                        focusNode: _saveButtonFocusNode,
                        onPressed: () {
                          sightMocks.add(Sight(
                            _nameFieldController.text,
                            Coordinates(
                                double.parse(_latitudeFieldController.text),
                                double.parse(_longitudeFieldController.text)),
                            "https://brilliant24.ru/files/cat/template_01.png",
                            _descriptionFieldController.text,
                            "Другое",
                          ));

                          Navigator.of(context).pushNamed('/');
                          setState(() {});
                        },
                        child: Text("СОЗДАТЬ",
                            style: textBold14.copyWith(color: Colors.white)),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
