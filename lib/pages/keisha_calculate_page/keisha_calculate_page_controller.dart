import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warikan/models/keisha_group.dart';

part 'keisha_calculate_page_controller.g.dart';
part 'keisha_calculate_page_controller.freezed.dart';

enum CalcSlope {
  fit,
  discount,
  premium,
//  キリよく割り勘、切り上げ割り勘、値引き割り勘
}

@freezed
class KeishaCalculatePageState with _$KeishaCalculatePageState {
  const factory KeishaCalculatePageState({
    required int inputTotal,
    required int inputPeople,
    required double divideResult,
    required List<KeishaGroup> keishaGroups,
  }) = _KeishaCalculatePageState;
}

@riverpod
class KeishaCalculatePageController extends _$KeishaCalculatePageController {
  @override
  KeishaCalculatePageState build() {
    return const KeishaCalculatePageState(
      inputTotal: 0,
      inputPeople: -1,
      divideResult: 0.0,
      keishaGroups: [],
    );
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
    if (state.inputTotal != -1 && state.inputPeople != -1) {
      // 割り勘結果
      double result = state.inputTotal / state.inputPeople;

      // 状態を更新
      state = state.copyWith(
        divideResult: result,
      );
    }
  }

  void addGroup(KeishaGroup group) {
    state = state.copyWith(
      keishaGroups: [...state.keishaGroups, group],
    );
  }

  void removeGroup(KeishaGroup group) {
    state = state.copyWith(
      keishaGroups: state.keishaGroups.where((g) => g != group).toList(),
    );
  }
}
