import 'package:flutter/material.dart';
import 'package:warikan/pages/calculate_page.dart';
import 'package:warikan/pages/event_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  int _selectedIndex = 0;

  final pages = [const CalculatePage(), const EventPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 30,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(
                size: 35,
                Icons.calculate,
              ),
              label: '割り勘'),
          NavigationDestination(
              icon: Icon(size: 35, Icons.event), label: 'イベント'),
        ],
      ),
    );
  }
}
