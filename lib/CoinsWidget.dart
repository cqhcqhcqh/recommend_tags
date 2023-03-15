import 'package:flutter/material.dart';

class CoinsWidget extends StatefulWidget {
  const CoinsWidget({super.key});
  @override
  State<CoinsWidget> createState() {
    return CoinsStatefulState();
  }
}

class CoinsStatefulState extends State<CoinsWidget> {
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
