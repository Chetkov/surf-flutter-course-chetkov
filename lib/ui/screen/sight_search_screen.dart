import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/search_history_model.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/widget/hr.dart';
import 'package:provider/provider.dart';

class SightSearchScreen extends StatefulWidget {
  @override
  State<SightSearchScreen> createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  TextEditingController _searchFieldController = TextEditingController();
  List<Sight> _searchedSights = [];

  @override
  void initState() {
    super.initState();
    _searchFieldController.addListener(() {
      _search(_searchFieldController.text);
    });
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    super.dispose();
  }

  void _search(String query) {
    if (query.isNotEmpty) {
      var queryInLowerCase = query.toLowerCase();
      List<Sight> result = [];
      for (Sight sight in sightMocks) {
        if (sight.name.toLowerCase().indexOf(queryInLowerCase) >= 0) {
          result.add(sight);
        }
      }
      setState(() {
        _searchedSights = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        title: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                "Список интересных мест",
                overflow: TextOverflow.clip,
                softWrap: true,
                style: text24w500,
              ),
              Container(
                padding: EdgeInsets.only(top: 22),
                height: 62,
                child: Consumer<SearchHistoryModel>(
                  builder: (context, searchHistory, widget) => TextField(
                    controller: _searchFieldController,
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    onChanged: (String text) {
                      _search(text);
                    },
                    onSubmitted: (text) {
                      _search(text);
                      setState(() {
                        searchHistory.addItem(text);
                      });
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: Container(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset('res/icons/search.svg'),
                        ),
                        contentPadding: EdgeInsets.all(0),
                        hintText: "Поиск",
                        hintStyle: textRegular16Third,
                        suffixIcon: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              _searchFieldController.clear();
                            });
                          },
                          child: Icon(
                            Icons.close,
                            color: textColorSecondary,
                          ),
                        ),
                        fillColor: Color(0xfff0f0f0),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12))
                        // enabled: false,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      // body: SearchHistoryWidget(searchFieldController: _searchFieldController),
      body: _searchedSights.isNotEmpty
          ? SearchResultWidget(_searchedSights)
          : SearchHistoryWidget(callback: (String query) {
              setState(() {
                _searchFieldController.text = query;
                _searchFieldController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _searchFieldController.text.length));
              });
            }),
    );
  }
}

class SearchResultWidget extends StatelessWidget {
  final List<Sight> _searchResult;

  const SearchResultWidget(this._searchResult);

  @override
  Widget build(BuildContext context) {
    return _searchResult.isNotEmpty
        ? ListView(
            children: _searchResult.map((sight) => FoundItem(sight)).toList(),
          )
        : EmptyListStub('Ничего не найдено',
            'Попробуйте изменить параметры\nпоиска', 'res/icons/search.svg',
            width: 48.0, height: 48.0);
  }
}

class FoundItem extends StatelessWidget {
  final Sight _sight;

  const FoundItem(this._sight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minVerticalPadding: 10,
          leading: Container(
            width: 56,
            height: 56,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                _sight.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            _sight.name,
            style: text16w500,
          ),
          subtitle: Text(
            _sight.type,
            style: textRegular14Secondary,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SightDetailsScreen(_sight)));
          },
        ),
        HorizontalLine(),
      ],
    );
  }
}

class SearchHistoryWidget extends StatelessWidget {
  final Function(String query) _callback;

  const SearchHistoryWidget({
    Key? key,
    required Function(String query) callback,
  })  : _callback = callback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchHistoryModel>(
      builder: (context, model, widget) => ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "ВЫ ИСКАЛИ",
              style: textRegular14Third,
            ),
          ),
          Column(
            children: model
                .getList()
                .map(
                  (item) => SearchHistoryItemWidget(
                    text: item,
                    searchHistoryModel: model,
                    callback: _callback,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

class SearchHistoryItemWidget extends StatelessWidget {
  final String _text;
  final SearchHistoryModel _historyModel;
  final Function(String query) _callback;

  const SearchHistoryItemWidget({
    Key? key,
    required String text,
    required SearchHistoryModel searchHistoryModel,
    required Function(String query) callback,
  })  : _text = text,
        _historyModel = searchHistoryModel,
        _callback = callback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          title: Text(_text),
          trailing: InkWell(
            onTap: () {
              _historyModel.removeItem(_text);
            },
            child: Icon(Icons.close),
          ),
          onTap: () {
            _callback(_text);
          },
        ),
        HorizontalLine(),
      ],
    );
  }
}
