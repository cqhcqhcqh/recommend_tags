import 'package:flutter/material.dart';

// ignore: empty_constructor_bodies
class TagsNavigationBar extends BottomNavigationBar {
  TagsNavigationBar(
      {super.key,
      required super.items,
      super.selectedItemColor = Colors.black,
      super.showUnselectedLabels = true,
      super.currentIndex = 1,
      // super.type = BottomNavigationBarType.fixed,
      super.onTap});
}
