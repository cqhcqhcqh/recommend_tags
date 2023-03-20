import 'package:flutter/material.dart';
import 'package:recommend_tags/RemoteAPI/CatesRemoteAPI.dart';
import 'package:recommend_tags/RemoteAPI/CoinsRemoteAPI.dart';
import 'package:recommend_tags/RemoteAPI/TagsRemoteAPI.dart';
import 'package:recommend_tags/common/theme.dart';
import 'Widget/SettingsWidget.dart';
import 'Widget/CaptionsWidget.dart';
import 'Widget/CoinsWidget.dart';
import 'Widget/TagsWidget.dart';
import 'NavigationBar/TagsNavigationBar.dart';
import 'Widget/NavigationBarBuilder.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'HashTags';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: appTheme,
      home: ChangeNotifierProvider(create: (context) => NavigationBarBuilder(),
       child: TarbarWidget()),
    );
  }
}

class TarbarWidget extends StatelessWidget {
  TarbarWidget({super.key});
  final List<Widget> _widgetOptions = <Widget>[
    TagsWidget(remoteAPI: TagsRemoteAPI(),),
    CaptionsWidget(remoteAPI: CatesRemoteAPI(),),
    CoinsWidget(remoteAPI: CoinsRemoteAPI(),),
    const AppSettingsWidget(),
  ];

  final List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.tag), label: "HashTag", backgroundColor: primaryColor),
      const BottomNavigationBarItem(
          icon: Icon(Icons.cabin), label: "Captions", backgroundColor: primaryColor),
      const BottomNavigationBarItem(
          icon: Icon(Icons.abc), label: "Coins", backgroundColor: primaryColor),
      const BottomNavigationBarItem(
          icon: Icon(Icons.settings), label: "Setting", backgroundColor: primaryColor),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("app bar title"),
      ),
      body: Center(child: Consumer<NavigationBarBuilder>(builder: (context, value, child) => _widgetOptions[value.selectedIndex],)),
      bottomNavigationBar: Consumer<NavigationBarBuilder>(builder: (context, value, child) => TagsNavigationBar(
        items: items,
        currentIndex: value.selectedIndex,
        onTap: value.updateSelectedIndex,
      )),
    );
  }
}
