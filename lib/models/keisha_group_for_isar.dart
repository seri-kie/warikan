import 'package:warikan/models/calc_slope.dart';
import 'package:warikan/models/keisha_group.dart';
import 'package:isar/isar.dart';

part 'keisha_group_for_isar.g.dart';

@embedded
class KeishaGroupForIsar {
  final String? groupName;
  final int? totalPeople;
  @Enumerated(EnumType.name)
  final CalcSlope? calcSlope;
  final int? totalAmount;

  KeishaGroupForIsar(
      {this.groupName, this.totalPeople, this.calcSlope, this.totalAmount});

  KeishaGroup toKeishaGroup() => KeishaGroup(
        groupName: groupName ?? '',
        totalPeople: totalPeople ?? 0,
        calcSlope: calcSlope ?? CalcSlope.fit,
        totalAmount: totalAmount ?? 0,
      );

  static KeishaGroupForIsar fromKeishaGroup(KeishaGroup group) =>
      KeishaGroupForIsar(
        groupName: group.groupName,
        totalPeople: group.totalPeople,
        calcSlope: group.calcSlope,
        totalAmount: group.totalAmount,
      );
}
