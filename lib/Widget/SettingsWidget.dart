import 'package:flutter/material.dart';

class AppSettingsWidget extends StatefulWidget {
  const AppSettingsWidget({super.key});

  @override
  State<AppSettingsWidget> createState() {
    return AppSettingsWidgetState();
  }
}

class AppSettingsWidgetState extends State<AppSettingsWidget> {
  void _cleanCache() {
    setState(() {
      _cache = "0.0 M";
    });
  }

  void _shareApp() {}
  void _contactUs() {}
  void _readPrivacyPolicy() {}

  static String _cache = "0.1 M";
  static const String _appVersion = "1.0";

  @override
  Widget build(BuildContext context) {
    List<ListTile> items = [
      const ListTile(
        leading: Icon(Icons.message),
        title: Text('Applicatoin Name'),
      ),
      const ListTile(
        leading: Icon(Icons.verified),
        title: Text('Build version'),
        subtitle: Text(_appVersion),
      ),
      ListTile(
        leading: const Icon(Icons.verified),
        title: const Text('Clean Cache'),
        subtitle: Text(_cache),
        onTap: _cleanCache,
      ),
      const ListTile(
        leading: Icon(Icons.verified),
        title: Text('Rate Us'),
        subtitle: Text('Please support us with you positive review'),
      ),
      ListTile(
        leading: const Icon(Icons.verified),
        title: const Text('Share It'),
        subtitle: const Text('Share our app with you friend and family'),
        onTap: _shareApp,
      ),
      ListTile(
        leading: const Icon(Icons.verified),
        title: const Text('Contact Us'),
        subtitle: const Text('Contact Us'),
        onTap: _contactUs,
      ),
      ListTile(
        leading: const Icon(Icons.verified),
        title: const Text('Privacy Policy'),
        subtitle: const Text('Privacy Policy'),
        onTap: _readPrivacyPolicy,
      ),
    ];
    return ListView(
      children: items,
    );
  }
}
