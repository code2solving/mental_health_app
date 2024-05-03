import 'package:flutter/material.dart';
class MoodModel {
  String name;
  String iconpath;

  MoodModel({
    required this.name,
    required this.iconpath,
  });
  static List<MoodModel> getMoods(){
    List<MoodModel> list=[];
    list.add(MoodModel(name: 'Love', iconpath: 'assets/icons/love.svg'));
    list.add(MoodModel(name: 'Cool', iconpath: 'assets/icons/cool.svg'));
    list.add(MoodModel(name: 'Happy', iconpath: 'assets/icons/happy.svg'));
    list.add(MoodModel(name: 'Sad', iconpath: 'assets/icons/sad.svg'));
    return list;
  }
  
}