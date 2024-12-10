import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:isar/isar.dart';
import 'package:warikan/models/event_keisha.dart';
import 'package:warikan/models/event_normal.dart';
import 'package:warikan/pages/event_page/widgets/list_tile_normal.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key, required this.isar});
  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _getAllEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('エラーが発生しました: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('イベントがありません'));
        } else {
          final events = snapshot.data!;
          return AnimationLimiter(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                if (event is EventNormal) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: ListTileNormal(event: event),
                        ),
                      ));
                } else if (event is EventKeisha) {
                  return ListTile(
                    title: Text(event.eventName),
                    subtitle: Text(
                        '割り勘結果: ${event.remainPerPerson}円, 人数: ${event.remainPeople}人, 割引の種類: ${event.keishaGroups.toString().split('.').last}'),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          );
        }
      },
    );
  }

  Future<List<dynamic>> _getAllEvents() async {
    final eventNormals = await isar.eventNormals.where().findAll();
    final eventKeishas = await isar.eventKeishas.where().findAll();
    final events = [...eventNormals, ...eventKeishas];
    events.sort((a, b) => a.date.compareTo(b.date));
    return events;
  }
}
