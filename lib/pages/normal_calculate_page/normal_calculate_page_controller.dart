import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'normal_calculate_page_controller.g.dart';
part 'normal_calculate_page_controller.freezed.dart';

enum FractionRound { none, roundUp, roundDown }

@freezed
class NormalCalculatePageState with _$NormalCalculatePageState {
  const factory NormalCalculatePageState({
    required int inputTotal,
    required int inputPeople,
    required FractionRound fraction,
    required double divideResult,
    required int fractionPrice,
    required double difference, // differenceフィールドを追加
  }) = _NormalCalculatePageState;
}

@riverpod
class NormalCalculatePageController extends _$NormalCalculatePageController {
  @override
  NormalCalculatePageState build() {
    return const NormalCalculatePageState(
      inputTotal: 0,
      inputPeople: 1,
      fraction: FractionRound.none,
      divideResult: 0.0,
      fractionPrice: 1,
      difference: 0.0, // 初期値を設定
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

  void setFraction(FractionRound value) {
    state = state.copyWith(fraction: value);
    divide();
  }

  void setFractionPrice(int value) {
    state = state.copyWith(fractionPrice: value);
    divide();
  }

  void divide() {
    // 人数と金額の両方が入力されている場合のみ計算を行う
    if (state.inputTotal != -1 && state.inputPeople != -1) {
      // 割り勘結果
      double result = state.inputTotal / state.inputPeople;
      // 端数処理の設定によって計算結果を変える
      if (state.fraction == FractionRound.roundUp) {
        // 端数処理が切り上げの場合、fractionPriceの値で切り上げを行う
        result =
            (result / state.fractionPrice).ceilToDouble() * state.fractionPrice;
      } else if (state.fraction == FractionRound.roundDown) {
        result = (result / state.fractionPrice).floorToDouble() *
            state.fractionPrice;
      }
      // 過不足の金額を計算
      double actualTotal = result * state.inputPeople;
      double difference = actualTotal - state.inputTotal;
      // 状態を更新
      state = state.copyWith(divideResult: result, difference: difference);
    }
  }
}
