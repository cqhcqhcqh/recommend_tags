import 'package:flutter/material.dart';

class CaptionsWidget extends StatefulWidget {
  const CaptionsWidget({super.key});
  @override
  State<CaptionsWidget> createState() {
    return CaptionsStatefulState();
  }
}

class CaptionsStatefulState extends State<CaptionsWidget> {
  @override
  Widget build(BuildContext context) {
    const rowHeight = 70.0;
    const itemCount = 20;
    return ListView.builder(
        itemCount: itemCount,
        itemExtent: rowHeight,
        itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text("title $index"), subtitle: Text("body $index")));
  }
}
