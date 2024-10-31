import 'package:flutter/material.dart';
import 'package:warikan/pages/normal_calculate_page/normal_calculate_page.dart';

class CalculatePage extends StatelessWidget {
  const CalculatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const TabBar(
              tabs: [
                Tab(
                  text: 'ノーマル割り勘',
                ),
                Tab(
                  text: '傾斜割り勘',
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: [NormalCalculatePage(), Text('傾斜')],
          ),
        ));
  }
}
