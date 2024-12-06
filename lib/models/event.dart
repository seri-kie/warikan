import 'package:warikan/models/keisha_group.dart';

class Event {
  final String eventName;
  final List<KeishaGroup>? keishaGroups;
  final int remainPerPerson;
  final int remainPeople;
  final DateTime date;

  Event({
    required this.eventName,
    required this.keishaGroups,
    required this.remainPerPerson,
    required this.remainPeople,
    required this.date,
  });
}
