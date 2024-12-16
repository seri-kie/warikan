import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:warikan/models/event_keisha.dart';
import 'package:warikan/pages/event_detail_page/event_detail_page_keisha.dart';

class ListTileKeisha extends StatelessWidget {
  const ListTileKeisha({
    super.key,
    required this.event,
    required this.isar,
    required this.onRefresh,
  });
  final EventKeisha event;
  final Isar isar;
  final VoidCallback onRefresh;

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
            ? '1人:${event.remainPerPerson.toStringAsFixed(0)}円,人数: ${event.allPeople}人\n傾斜グループ数: ${event.keishaGroups?.length}' // 整数として表示
            : '1人:${event.remainPerPerson.toStringAsFixed(3)}円,人数: ${event.allPeople}\n傾斜グループ数: ${event.keishaGroups?.length}'),
        leading: const CircleAvatar(
          backgroundColor: Colors.lightBlueAccent,
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
          Navigator.of(context)
              .push(MaterialPageRoute(
            builder: (context) => EventDetailPageKeisha(
              event: event,
              isar: isar,
            ),
          ))
              .then((_) {
            // 戻ってきたときにリフレッシュ
            onRefresh();
          });
        },
      ),
    );
  }
}
