import 'package:flutter/material.dart';
import 'package:recommend_tags/CaptionsWidget.dart';
import 'package:recommend_tags/CoinsWidget.dart';
import 'TagsNavigationBar.dart';
import 'TagsRemoteAPI.dart';
import 'SettingsWidget.dart';
import 'CaptionsWidget.dart';
import 'CoinsWidget.dart';
import 'TagsWidget.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const TarbarWidget(),
    );
  }
}

class TarbarWidget extends StatefulWidget {
  const TarbarWidget({super.key});
  @override
  State<TarbarWidget> createState() {
    return _TabbarWidgetState();
  }
}

class _TabbarWidgetState extends State<TarbarWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    TagsWidget(),
    CaptionsWidget(),
    CoinsWidget(),
    AppSettingsWidget(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color theme = Colors.purple;
    final List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.tag), label: "HashTag", backgroundColor: theme),
      const BottomNavigationBarItem(
          icon: Icon(Icons.cabin), label: "Captions", backgroundColor: theme),
      const BottomNavigationBarItem(
          icon: Icon(Icons.abc), label: "Coins", backgroundColor: theme),
      const BottomNavigationBarItem(
          icon: Icon(Icons.settings), label: "Setting", backgroundColor: theme),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("app bar title"),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: TagsNavigationBar(
        items: items,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
