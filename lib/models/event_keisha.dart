import 'package:isar/isar.dart';
import 'package:warikan/models/keisha_group_for_isar.dart';

part 'event_keisha.g.dart';

@collection
class EventKeisha {
  Id id = Isar.autoIncrement;

  String eventName;
  final List<KeishaGroupForIsar>? keishaGroups;
  final double remainPerPerson;
  final int remainPeople;
  final DateTime date;

  EventKeisha({
    this.eventName = 'イベント名未設定',
    required this.keishaGroups,
    required this.remainPerPerson,
    required this.remainPeople,
    required this.date,
  });
}
