import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warikan/models/event_normal.dart';

class ListTileNormal extends StatelessWidget {
  const ListTileNormal({super.key, required this.event});
  final EventNormal event;

  @override
  Widget build(BuildContext context) {
    // 日付のフォーマットを定義
    final dateFormatter = DateFormat('yyyy/MM/dd');
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(event.eventName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(event.remainPerPerson % 1 == 0 // 整数の場合
            ? '1人:${event.remainPerPerson.toStringAsFixed(0)}円,人数: ${event.remainPeople}人' // 整数として表示
            : '1人:${event.remainPerPerson.toStringAsFixed(3)}円,人数: ${event.remainPeople}人'),
        leading: const CircleAvatar(
          backgroundColor: Colors.lightGreen,
          child: Icon(
            Icons.calculate,
            color: Colors.white,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dateFormatter.format(event.date),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        onTap: () {
          // イベント詳細ページへと遷移
        },
      ),
    );
  }
}
