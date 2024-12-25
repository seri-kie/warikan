import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warikan/models/calc_slope.dart';
import 'package:warikan/models/event_keisha.dart';
import 'package:warikan/models/event_normal.dart';
import 'package:warikan/models/keisha_group.dart';

part 'keisha_calculate_page_controller.g.dart';
part 'keisha_calculate_page_controller.freezed.dart';

@freezed
class KeishaCalculatePageState with _$KeishaCalculatePageState {
  const factory KeishaCalculatePageState({
    required int inputTotal,
    required int inputPeople,
    required double divideResult,
    required int remainingAmount,
    required int remainingPeople,
    required int groupPeople,
    required List<KeishaGroup> keishaGroups,
    required Isar isar,
  }) = _KeishaCalculatePageState;
}

@riverpod
class KeishaCalculatePageController extends _$KeishaCalculatePageController {
  @override
  KeishaCalculatePageState build() {
    return KeishaCalculatePageState(
        inputTotal: 0,
        inputPeople: -1,
        divideResult: 0.0,
        remainingAmount: 0,
        remainingPeople: 0,
        groupPeople: 0,
        keishaGroups: [],
        isar: Isar.getInstance()!);
  }

  void setInputTotal(int value) {
    state = state.copyWith(inputTotal: value);
    divide();
  }

  void setInputPeople(int value) {
    state = state.copyWith(inputPeople: value);
    divide();
  }

  void divide() {
    // 人数と金額の両方が入力されている場合のみ計算を行う
    if (state.inputTotal > 0 && state.inputPeople > 0) {
      double result = state.inputTotal / state.inputPeople;
      state = state.copyWith(
        divideResult: result,
        remainingAmount: state.inputTotal,
      );
      // キリよく！グループが存在する場合は、キリよく！グループの計算処理を行う
      if (isFitGroupExist()) {
        fitCalc();
      }
      // 割引、割増グループが存在する場合は、割引、割増グループの計算処理を行う
      if (isDiscountOrPremiumGroupExist()) {
        discountAndPremiumCalc();
      }
    }
  }

  Future<int> getEventCount() async {
    final eventCountNormal = await state.isar.eventNormals.count();
    final eventCountKeisha = await state.isar.eventKeishas.count();
    return eventCountNormal + eventCountKeisha;
  }

  // キリよく！グループの計算処理
  void fitCalc() {
    // `CalcSlope.fit`のグループを抽出
    final fitGroups =
        state.keishaGroups.where((group) => group.calcSlope == CalcSlope.fit);

    // 合計金額から`fit`グループ分を引き算し、残額を計算
    int remainingAmount = state.inputTotal;
    int remainingPeople = state.inputPeople;

    for (final group in fitGroups) {
      // グループ分を引き算
      remainingAmount -= group.totalAmount * group.totalPeople;
      remainingPeople -= group.totalPeople;
    }

    // 残額を残りの人で割り勘
    double remainPerPerson =
        remainingPeople > 0 ? remainingAmount / remainingPeople : 0.0;

    // 状態を更新
    state = state.copyWith(
      divideResult: remainPerPerson,
      remainingAmount: remainingAmount,
      remainingPeople: remainingPeople,
    );
  }

// 割り引き、割り増しの計算処理
  void discountAndPremiumCalc() {
    // 割引グループを取得
    final discountGroups = state.keishaGroups
        .where((group) => group.calcSlope == CalcSlope.discount);
    // 割引グループを取得
    final premiumGroups = state.keishaGroups
        .where((group) => group.calcSlope == CalcSlope.premium);
    // 現在の残額と残り人数を取得
    int remainingAmount = state.remainingAmount;
    int remainingPeople = state.remainingPeople;

    // 割引対象者の総支払額減少分を計算
    for (final group in discountGroups) {
      final discountTotal = group.totalAmount * group.totalPeople;
      remainingAmount += discountTotal;
      remainingPeople -= group.totalPeople;
    }
    // 割増対象者の総支払額増加分を計算
    for (final group in premiumGroups) {
      final premiumTotal = group.totalAmount * group.totalPeople;
      remainingAmount -= premiumTotal;
      remainingPeople -= group.totalPeople;
    }
    final remainPerPerson = remainingAmount / state.inputPeople;
    // 状態を更新
    state = state.copyWith(
      divideResult: remainPerPerson,
      remainingAmount: remainingAmount,
      remainingPeople: remainingPeople,
      // 更新された残額を保存
    );
  }

  // キリよく！グループが存在するかの判定
  bool isFitGroupExist() {
    return state.keishaGroups.any((group) => group.calcSlope == CalcSlope.fit);
  }

  // 割り引き、割り増しのグループが存在するかの判定
  bool isDiscountOrPremiumGroupExist() {
    return state.keishaGroups.any((group) => group.calcSlope != CalcSlope.fit);
  }

  // グループの人数判定
  bool canAddGroup(int totalPeople) {
    return state.inputPeople > state.groupPeople + totalPeople;
  }

  void addGroup(KeishaGroup group) {
    state = state.copyWith(
      keishaGroups: [...state.keishaGroups, group],
      groupPeople: state.groupPeople + group.totalPeople,
    );
  }

  void removeGroup(KeishaGroup group) {
    state = state.copyWith(
      keishaGroups: state.keishaGroups.where((g) => g != group).toList(),
    );
  }
}
