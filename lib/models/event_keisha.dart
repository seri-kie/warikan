import 'package:isar/isar.dart';
import 'package:warikan/models/event.dart';
import 'package:warikan/models/keisha_group_for_isar.dart';

part 'event_keisha.g.dart';

@collection
class EventKeisha extends Event {
  Id id = Isar.autoIncrement;

  final List<KeishaGroupForIsar>? keishaGroups;

  EventKeisha({
    required super.remainPerPerson,
    required super.remainPeople,
    required super.date,
    required this.keishaGroups,
  });
}
