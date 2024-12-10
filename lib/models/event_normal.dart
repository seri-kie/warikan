import 'package:isar/isar.dart';
import 'package:warikan/models/event.dart';
import 'package:warikan/pages/normal_calculate_page/normal_calculate_page_controller.dart';

part 'event_normal.g.dart';

@collection
class EventNormal extends Event {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  final FractionRound fraction;
  final double difference;

  EventNormal({
    required super.remainPerPerson,
    required super.remainPeople,
    required super.date,
    required this.fraction,
    required this.difference,
  });
}
