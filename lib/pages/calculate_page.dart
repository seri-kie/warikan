import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:warikan/pages/keisha_calculate_page/keisha_calculate_page.dart';
import 'package:warikan/pages/normal_calculate_page/normal_calculate_page.dart';

class CalculatePage extends StatelessWidget {
  const CalculatePage({super.key, required this.isar});

  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
            body: TabBarView(
              children: [
                NormalCalculatePage(isar: isar),
                KeishaCalculatePage(isar: isar),
              ],
            ),
          ),
        ));
  }
}
