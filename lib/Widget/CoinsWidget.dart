import 'package:flutter/material.dart';
import 'package:recommend_tags/Models/CoinsModel.dart';
import 'package:recommend_tags/RemoteAPI/CoinsRemoteAPI.dart';
import 'package:recommend_tags/main.dart';

class CoinsWidget extends StatefulWidget {
  const CoinsWidget({super.key});
  @override
  State<CoinsWidget> createState() {
    return CoinsStatefulState();
  }
}

class CoinsStatefulState extends State<CoinsWidget> {
  CoinsModel? coins;
  @override
  void initState() {
    super.initState();
    coins = remoteAPI.cached;
    requestCoins();
  }

  void requestCoins() async {
    coins = await remoteAPI.get();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  Widget? _buildSeparator(BuildContext context, int index) {
    final coin = coins!.coins[index];
    final Color divideColor = Theme.of(context).dividerColor;
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, color: divideColor),
        ),
      ),
      child: ListTile(title: Text('${coin.price}'), subtitle: Text('coi')),
    );
  }

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

  CoinsRemoteAPI get remoteAPI => MyApp.container.coinsAPI;
}
