import 'package:flutter/material.dart';
class FeatureModel {
  String imagePath;
  String theme;
  String themeText;
  Color color;


  FeatureModel({
    required this.imagePath,
    required this.theme,
    required this.themeText,
    required this.color,
  });

  static List<FeatureModel> getFeatures(){
    List<FeatureModel> list=[];
    list.add(FeatureModel(imagePath: 'assets/icons/dog.svg', theme: 'Positive Vibes', themeText: 'Boost your mood with \n positive vibes',color: Colors.lightGreen));
    list.add(FeatureModel(imagePath: 'assets/icons/comp.svg', theme: 'Healthy Vibes', themeText: 'Boost your health         \n', color: Colors.teal));
    return list;
  }
}