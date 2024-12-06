import 'package:warikan/models/calc_slope.dart';

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
