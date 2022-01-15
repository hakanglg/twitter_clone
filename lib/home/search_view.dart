import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  double _padding = 20;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _downIconButton,
        _emptySpace,
        _trendTitleWidget,
        ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
            height: 1,
          ),
          itemBuilder: (BuildContext context, int index) => Card(
            margin: EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    style: BorderStyle.none, color: Colors.transparent)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Wrap(
                    direction: Axis.vertical,
                    spacing: 10,
                    children: [
                      Text("data"),
                      Text("data"),
                      Text("data"),
                    ],
                  )),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget get _emptySpace => SizedBox(
        height: 10,
      );
  Widget get _downIconButton => Container(
        child: Icon(
          Icons.arrow_downward,
          color: CupertinoColors.inactiveGray,
        ),
      );

  Widget get _trendTitleWidget => Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(color: CupertinoColors.inactiveGray, width: 0.5)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _padding),
          alignment: Alignment.centerLeft,
          height: 50,
          child: Text(
            "Trends for you",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      );

  final titleTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      letterSpacing: 1,
      color: Colors.black);
}
