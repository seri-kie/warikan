import 'package:isar/isar.dart';
import 'package:warikan/models/keisha_group_for_isar.dart';

part 'event_keisha.g.dart';

@collection
class EventKeisha {
  Id id = Isar.autoIncrement;

  final String eventName;
  final List<KeishaGroupForIsar>? keishaGroups;
  final int remainPerPerson;
  final int remainPeople;
  final DateTime date;

  EventKeisha({
    required this.eventName,
    required this.keishaGroups,
    required this.remainPerPerson,
    required this.remainPeople,
    required this.date,
  });
  set eventName(String eventName) {
    eventName = eventName;
  }
}
