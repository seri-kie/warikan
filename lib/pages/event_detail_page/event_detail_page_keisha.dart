import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:warikan/models/calc_slope.dart';
import 'package:warikan/models/event_keisha.dart';

class EventDetailPageKeisha extends StatefulWidget {
  const EventDetailPageKeisha(
      {super.key, required this.event, required this.isar});
  final EventKeisha event;
  final Isar isar;

  @override
  State<EventDetailPageKeisha> createState() => _EventDetailPageKeishaState();
}

class _EventDetailPageKeishaState extends State<EventDetailPageKeisha> {
  late List<TextEditingController> _nameControllers;
  late List<bool> _payList;
  bool _isChanged = false;

  @override
  void initState() {
    super.initState();
    _nameControllers = List.generate(widget.event.allPeople,
        (index) => TextEditingController(text: widget.event.nameList[index]));
    _payList = widget.event.payList;
  }

  @override
  void dispose() async {
    for (var controller in _nameControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _updateEventData() async {
    // 名前のリストと支払いのリストを更新
    widget.event.nameList
        .setAll(0, _nameControllers.map((controller) => controller.text));
    widget.event.payList.setAll(0, _payList);

    await widget.isar.writeTxn(() async {
      await widget.isar.eventKeishas.put(widget.event);
    });
  }

  void _onListChanged() {
    setState(() {
      _isChanged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('yyyy/MM/dd');
    final String formattedDate = dateFormatter.format(widget.event.date);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.event.eventName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                // 確認のダイアログを表示
                await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('イベントの削除'),
                      content: const Text('本当に削除しますか？'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('キャンセル'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // イベントを削除する処理
                            await widget.isar.writeTxn(() async {
                              await widget.isar.eventKeishas
                                  .delete(widget.event.id);
                            });
                            if (context.mounted) {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('イベントが削除されました')),
                              );
                            }
                          },
                          child: const Text('削除',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 35,
              ))
        ],
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'イベント名: ${widget.event.eventName}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.event.remainPerPerson % 1 == 0 // 整数の場合
                  ? '1人あたり:${widget.event.remainPerPerson.toStringAsFixed(0)}円'
                  : '1人あたり:${widget.event.remainPerPerson.toStringAsFixed(3)}円',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            if (widget.event.keishaGroups != null)
              for (var group in widget.event.keishaGroups!)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    group.calcSlope == CalcSlope.fit
                        ? '${group.groupName}: ${group.totalPeople}人, 金額: ${group.totalAmount}円(キリよく)'
                        : group.calcSlope == CalcSlope.premium
                            ? '${group.groupName}: ${group.totalPeople}人, 金額: ${widget.event.remainPerPerson + (group.totalAmount ?? 0)}円 (割り増し: ${group.totalAmount}円)'
                            : '${group.groupName}: ${group.totalPeople}人, 金額: ${widget.event.remainPerPerson - (group.totalAmount ?? 0)}円 (割り引き: ${group.totalAmount}円)',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
            Text(
              widget.event.keishaGroups!.isEmpty
                  ? '人数: ${widget.event.remainPeople}人'
                  : 'その他人数: ${widget.event.remainPeople}人',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              '日付: $formattedDate',
              style: const TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('・回収チェックリスト', style: TextStyle(fontSize: 18)),
                // 保存ボタン
                ElevatedButton(
                  onPressed: _isChanged
                      ? () async {
                          await _updateEventData();
                          setState(() {
                            _isChanged = false; // 保存後はボタンを無効に
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    '保存',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.event.allPeople,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: _payList[index],
                        onChanged: (bool? value) {
                          setState(() {
                            _payList[index] = value ?? false;
                          });
                          _onListChanged();
                        },
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _nameControllers[index],
                          decoration: InputDecoration(
                            labelText: '名前 ${index + 1}',
                          ),
                          onChanged: (value) {
                            _onListChanged();
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
