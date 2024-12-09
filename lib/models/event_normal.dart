import 'package:isar/isar.dart';
import 'package:warikan/pages/normal_calculate_page/normal_calculate_page_controller.dart';

part 'event_normal.g.dart';

@collection
class EventNormal {
  Id id = Isar.autoIncrement;

  String eventName;
  final double divideResult;
  final int inputPeople;
  @Enumerated(EnumType.name)
  final FractionRound fraction;
  final double difference;
  final DateTime date;

  EventNormal({
    this.eventName = 'イベント名未設定',
    required this.divideResult,
    required this.inputPeople,
    required this.fraction,
    required this.difference,
    required this.date,
  });
}
