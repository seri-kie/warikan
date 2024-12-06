import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:warikan/models/event_normal.dart';

class EventSavePopUp extends StatelessWidget {
  EventSavePopUp({super.key, required this.isar, required this.event});
  final TextEditingController eventNameController = TextEditingController();
  final Isar isar;
  final EventNormal event;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('イベントを保存'),
      icon: const Icon(Icons.event),
      content: TextField(
        controller: eventNameController,
        decoration: const InputDecoration(
          hintText: 'イベント名を入力してください',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () async {
            String eventName = eventNameController.text;
            if (eventName.isNotEmpty) {
              event.eventName = eventName;
            }
            await isar.writeTxn(() async {
              await isar.eventNormals.put(event);
            });
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
}
