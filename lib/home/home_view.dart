import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView(this.controller);

  final ScrollController controller;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _gitHubPhotoUrl =
      "https://avatars.githubusercontent.com/u/58719777?v=4";
  String _randomImage = "https://picsum.photos/200/300";
  String _dummyTweet =
      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words.";
  int defaultTabLength = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: _fabButton, body: _listView);
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.panorama_fish_eye_outlined,
        ),
      );

  Widget get _expandedListView => Expanded(child: _listView);

  Widget get _listView => ListView.builder(
      itemCount: 5,
      controller: widget.controller,
      itemBuilder: (context, index) {
        return _listViewCard;
      });

  Widget get _listViewCard => Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_randomImage),
          ),
          title: Wrap(
            runSpacing: 5,
            children: [
              _listCardTitle("Hello"),
              Text(_dummyTweet),
              _placeHolderField,
              _footerButtonRow
            ],
          ),
        ),
      );

  Widget _listCardTitle(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget get _placeHolderField => Container(
        height: 100,
        child: Placeholder(),
      );

  Widget get _footerButtonRow => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton,
        ],
      );

  Widget _iconLabel(String text) => Wrap(
        spacing: 5,
        children: [
          Icon(
            Icons.comment,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text)
        ],
      );

  Widget get _iconLabelButton => InkWell(
        child: _iconLabel("1"),
        onTap: () {},
      );

  final titleTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      letterSpacing: 1,
      color: Colors.black);
}
