import 'package:flutter/material.dart';
import 'package:recommend_tags/main.dart';
import 'package:recommend_tags/Models/TagCatesModel.dart';
import 'package:recommend_tags/RemoteAPI/CatesRemoteAPI.dart';

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

  @override
  void initState() {
    super.initState();
    cates = remoteAPI.cached;
    requestCoins();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TagCates? cates;
  void requestCoins() async {
    cates = await remoteAPI.get();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  CatesRemoteAPI get remoteAPI => MyApp.container.catesAPI;
}
