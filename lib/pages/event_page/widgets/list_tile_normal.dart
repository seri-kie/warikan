import 'package:flutter/material.dart';
import 'package:warikan/models/event_normal.dart';

class ListTileNormal extends StatelessWidget {
  const ListTileNormal({super.key, required this.event});
  final EventNormal event;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(event.eventName),
      subtitle:
          Text('割り勘結果: ${event.remainPerPerson}円, 人数: ${event.remainPeople}人'),
    );
  }
}
