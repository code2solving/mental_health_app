import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentalhealthapp/models/feature_model.dart';
import 'package:mentalhealthapp/models/mood_model.dart';
import 'package:mentalhealthapp/pages/CalenderPage.dart';
import 'package:mentalhealthapp/pages/sportListPage.dart';
import 'package:mentalhealthapp/pages/userProfilePage.dart';

import 'mainHome.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  List<MoodModel> moods = [];

  @override
  State<StatefulWidget> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;

  List<Widget> pages=[
    MainHomePage(),
    SportsListPage(),
    CalendarPage(),
    UserProfilePage(),
  ];


  void _navigateBar(int index){
    setState((){
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 25,right: 25,left: 25),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar(),
            body: pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type:BottomNavigationBarType.fixed,
            onTap: _navigateBar,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label:''),
              BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded),label:''),
              BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label:''),
              BottomNavigationBarItem(icon: Icon(Icons.person),label:''),
            ],
          ) ,
          ),
        ),
    );
  }
}

