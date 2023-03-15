import 'package:flutter/material.dart';

class TagsWidget extends StatefulWidget {
  const TagsWidget({super.key});
  @override
  State<TagsWidget> createState() {
    return TagsStatefulState();
  }
}

Widget? _buildSeparator(BuildContext context, int index) {
  final Color divideColor = Theme.of(context).dividerColor;
  return DecoratedBox(
    position: DecorationPosition.foreground,
    decoration: BoxDecoration(
      border: Border(
        bottom: Divider.createBorderSide(context, color: divideColor),
      ),
    ),
    child: ListTile(
        title: Text('title $index'), subtitle: Text('subtitle $index')),
  );
}

class TagsStatefulState extends State<TagsWidget> {
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
