import 'package:flutter/material.dart';

import '../home_view.dart';

class TwitterTabbarView extends StatefulWidget {
  @override
  _TwitterTabbarViewState createState() => _TwitterTabbarViewState();
}

class _TwitterTabbarViewState extends State<TwitterTabbarView> {
  String _gitHubPhotoUrl =
      "https://avatars.githubusercontent.com/u/58719777?v=4";

  double lastOffSet = 0;
  bool isHeaderClose = false;
  late ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController();

    controller.addListener(() {
      if (controller.offset <= 0) {
        isHeaderClose = false;
      } else if (controller.offset >= controller.position.maxScrollExtent) {
        isHeaderClose = false;
      } else {
        isHeaderClose = true;
      }
      isHeaderClose = controller.offset > lastOffSet ? true : false;
      setState(() {
        lastOffSet = controller.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 4,
          child: Scaffold(
            floatingActionButton: _fabButton,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            bottomNavigationBar: _bottomAppBar,
            body: Column(
              children: [
                _containerAppbar,
                //_tabbarItems,
                Expanded(
                    child: TabBarView(
                  children: [
                    HomeView(controller),
                    Text("sasdas"),
                    Text("sasdas"),
                    Text("sasdas"),
                  ],
                ))
              ],
            ),
          )),
    );
  }

  Widget get _bottomAppBar => BottomAppBar(
        child: _tabbarItems,
        // shape: CircularNotchedRectangle(),
        // notchMargin: 5,
      );

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      );

  Widget get _appBar => AppBar(
        elevation: 0,
        title: _appBarItems,
      );

  Widget get _containerAppbar => AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: isHeaderClose ? 0 : 50,
      child: _appBar);

  Widget get _appBarItems => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(_gitHubPhotoUrl),
          ),
          Text(
            "Home",
            style: titleTextStyle,
          )
        ],
      );

  Widget get _tabbarItems => TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.search),
          ),
          Tab(
            icon: Icon(Icons.notifications_none),
          ),
          Tab(
            icon: Icon(Icons.email_outlined),
          )
        ],
      );

  final titleTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      letterSpacing: 1,
      color: Colors.black);
}
