import 'package:warikan/pages/keisha_calculate_page/keisha_calculate_page_controller.dart';

class KeishaGroup {
  final String groupName;
  final int totalPeople;
  final CalcSlope calcSlope;
  final int totalAmount;

  KeishaGroup(
      {required this.groupName,
      required this.totalPeople,
      required this.calcSlope,
      required this.totalAmount});
}
