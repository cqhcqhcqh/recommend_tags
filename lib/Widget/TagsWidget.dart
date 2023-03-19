import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:recommend_tags/Models/HashTagsModel.dart';
import 'package:recommend_tags/RemoteAPI/TagsRemoteAPI.dart';
import 'package:recommend_tags/main.dart';

class TagsWidget extends StatefulWidget {
  const TagsWidget({super.key});
  @override
  State<TagsWidget> createState() {
    return TagsStatefulState();
  }
}

class TagsStatefulState extends State<TagsWidget> {
  Widget? _buildSeparator(BuildContext context, int index) {
    final tag = tags![index];
    const shadow = BoxShadow(
        color: Colors.purple,
        // offset: Offset(5, 5),
        spreadRadius: 2,
        blurRadius: 5,
        blurStyle: BlurStyle.normal);
    final Color divideColor = Theme.of(context).dividerColor;
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [shadow],
        color: Colors.green,
        border: Border.all(width: 1, color: Colors.red),
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10), bottom: Radius.circular(5)),
      ),
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(20),
      child:
          ListTile(title: Text(tag.content), subtitle: Text('subtitle $index')),
    );
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, color: divideColor),
        ),
      ),
      child:
          ListTile(title: Text(tag.content), subtitle: Text('subtitle $index')),
    );
  }

  List<HashTags>? tags;
  @override
  void initState() {
    super.initState();
    tags = remoteAPI.cached;
    requestTags();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void requestTags() async {
    final tags = await remoteAPI.get();
    if (tags != null) {
      this.tags = tags;
    }
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final count = itemCount();
    if (count == 0) {
      return const Text("数据为空");
    }
    // const itemExtent = 70.0;
    return ListView.builder(itemCount: count, itemBuilder: _buildSeparator);
  }

  int itemCount() {
    return tags?.length ?? 0;
  }

  TagsRemoteAPI get remoteAPI => MyApp.container.tagsAPI;
}
