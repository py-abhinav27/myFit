import 'package:flutter/material.dart';

class TabIconData {
  String image;
  String selectedImage;
  bool isSelected;
  int index;
  AnimationController? animationController;

  TabIconData({
    this.image = '',
    this.index = 0,
    this.selectedImage = '',
    this.isSelected = false,
    this.animationController,
  });

  static List<TabIconData> tabIconsList = [
    TabIconData(
      image: 'lib/assets/images/tab_1.png',
      selectedImage: 'lib/assets/images/tab_1s.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      image: 'lib/assets/images/tab_2.png',
      selectedImage: 'lib/assets/images/tab_2s.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      image: 'lib/assets/images/tab_3.png',
      selectedImage: 'lib/assets/images/tab_3s.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      image: 'lib/assets/images/tab_4.png',
      selectedImage: 'lib/assets/images/tab_4s.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
