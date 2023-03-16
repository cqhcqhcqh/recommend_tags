import 'package:flutter/material.dart';
import 'package:recommend_tags/RemoteAPI/TagsRemoteAPI.dart';

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

class NavigationBarDependencyContainer {
  final tagsAPI = TagsRemoteAPI();
}
