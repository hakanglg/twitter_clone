import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/home/tabbar_view.dart';
import 'package:twitter_clone/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: TwitterTabbarView(),
      theme: ThemeData.light().copyWith(
        appBarTheme:
            AppBarTheme(color: Theme.of(context).scaffoldBackgroundColor),
        tabBarTheme: TabBarTheme(
          labelColor: CupertinoColors.activeBlue,
          unselectedLabelColor: CupertinoColors.inactiveGray,
        ),
      ),
    );
  }
}