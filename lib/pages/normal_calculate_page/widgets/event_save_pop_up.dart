import 'package:flutter/material.dart';

class EventSavePopUp extends StatelessWidget {
  EventSavePopUp({super.key});
  final TextEditingController eventNameController = TextEditingController();
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
          onPressed: () {
            String eventName = eventNameController.text;
            debugPrint(eventNameController.text);
            if (eventName.isEmpty) {
              eventName = 'イベント名未設定';
            }
            Navigator.of(context).pop();
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
}
