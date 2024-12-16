import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:warikan/pages/calculate_page.dart';
import 'package:warikan/pages/event_page/event_page.dart';
import 'package:warikan/pages/setting_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.isar,
  });

  final Isar isar;
  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  int _selectedIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      CalculatePage(
        isar: widget.isar,
      ),
      EventPage(
        isar: widget.isar,
      ),
      const SettingPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 55,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(
                size: 30,
                Icons.calculate,
              ),
              label: '割り勘'),
          NavigationDestination(
              icon: Icon(size: 30, Icons.event), label: 'イベント'),
          NavigationDestination(
              icon: Icon(size: 30, Icons.settings), label: '設定'),
        ],
      ),
    );
  }
}
