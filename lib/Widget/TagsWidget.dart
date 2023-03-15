import 'package:flutter/material.dart';
import 'package:recommend_tags/Models/HashTagsModel.dart';
import 'package:recommend_tags/RemoteAPI/TagsRemoteAPI.dart';

class TagsWidget extends StatefulWidget {
  const TagsWidget({super.key});
  @override
  State<TagsWidget> createState() {
    return TagsStatefulState();
  }
}

class TagsStatefulState extends State<TagsWidget> {
  Widget? _buildSeparator(BuildContext context, int index) {
    if (tags == null || tags!.isEmpty) {
      return const Text("数据为空");
    }
    final tag = tags![index];
    final Color divideColor = Theme.of(context).dividerColor;
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, color: divideColor),
        ),
      ),
      child: ListTile(
          title: Text(tag.allLabels()), subtitle: Text('subtitle $index')),
    );
  }

  late final List<HashTags>? tags;
  final remoteAPI = TagsRemoteAPI();
  @override
  void initState() {
    super.initState();
    requestTags();
  }

  void requestTags() async {
    final tags = await remoteAPI.get();
    if (tags != null) {
      this.tags = tags;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const itemCount = 20;
    const itemExtent = 70.0;
    return ListView.builder(
        itemCount: itemCount,
        itemExtent: itemExtent,
        itemBuilder: _buildSeparator);
  }
}
